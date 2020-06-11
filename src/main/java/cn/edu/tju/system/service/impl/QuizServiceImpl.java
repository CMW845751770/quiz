package cn.edu.tju.system.service.impl;


import cn.edu.tju.security.entity.CurrentUser;
import cn.edu.tju.system.base.ServerResponse;
import cn.edu.tju.system.base.constant.QuizConst;
import cn.edu.tju.system.dto.input.PageInputDTO;
import cn.edu.tju.system.dto.output.*;
import cn.edu.tju.system.entity.Answer;
import cn.edu.tju.system.entity.OptionDO;
import cn.edu.tju.system.entity.ProblemDO;
import cn.edu.tju.system.entity.Record;
import cn.edu.tju.system.mapper.AnswerMapper;
import cn.edu.tju.system.mapper.OptionMapper;
import cn.edu.tju.system.mapper.ProblemMapper;
import cn.edu.tju.system.mapper.RecordMapper;
import cn.edu.tju.system.service.QuizService;
import cn.edu.tju.system.utils.JacksonUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.github.pagehelper.PageHelper;
import com.google.common.collect.Lists;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/9 16:39
 */
@Service
@Slf4j
public class QuizServiceImpl implements QuizService {

    @Resource
    private RecordMapper recordMapper;
    @Resource
    private RedisTemplate<String, Integer> redisTemplate;
    @Resource
    private RedisTemplate<String, ProblemDO> problemRedisTemplate;
    @Resource
    private OptionMapper optionMapper;
    @Resource
    private ProblemMapper problemMapper;
    @Resource
    private AnswerMapper answerMapper;


    /**
     * 创建数据库答题记录  设置Redis中的key
     * 如果多次调用 判断Redis中的key是否为null 不为null说明在考试状态中
     * 为null 才调用成功
     *
     * @return
     */
    @Override
    public ServerResponse startQuiz() {
        CurrentUser currentUser = CurrentUser.getCurrentUser();
        Integer recordId = redisTemplate.opsForValue().get(String.format(QuizConst.QUIZ_RECORD_PREFIX,
                currentUser.getId()));
        // 说明上次答题还没有结束，返回上次未答完的题目
        if (recordId != null) {
            ProblemDO problemDO = problemRedisTemplate.opsForValue().get(String.format(QuizConst.QUIZ_PROBLEM_LIST_PREFIX
                    , currentUser.getId()));
            //上次作答的题目还没有过期
            if(problemDO != null){
                //重新设置过期时间
                problemRedisTemplate.expire(String.format(QuizConst.QUIZ_PROBLEM_LIST_PREFIX
                        , currentUser.getId()),QuizConst.PROBLEM_EXPIRES_SECONDS,TimeUnit.SECONDS)  ;
                int score = recordMapper.selectScoreByPrimaryKey(recordId);
                LostConnectionResultDTO lostConnectionResultDTO = new LostConnectionResultDTO() ;
                lostConnectionResultDTO.setProblemOutputDTO(buildProblemOutputDTO(problemDO))
                        .setScore(score) ;
                return ServerResponse.createBySuccess(lostConnectionResultDTO);
            }
            //上次作答的题目已过期
            return getResult() ;
        }
        //创建一个score为0的Record
        Record record = new Record();
        record.setUid(currentUser.getId())
                .setScore(0);
        int rows = recordMapper.insert(record);
        if (rows < 1) {
            return ServerResponse.createByErrorMessage("创建答题记录失败");
        }
        //创建成功之后还需要在Redis中设置一下rid
        redisTemplate.opsForValue().set(String.format(QuizConst.QUIZ_RECORD_PREFIX,
                currentUser.getId()), record.getId());
        return ServerResponse.createBySuccess();
    }

    private ProblemOutputListDTO buildProblemOutputDTO(ProblemDO problemDO) {
        ProblemOutputListDTO problemOutputListDTO = new ProblemOutputListDTO();
        BeanUtils.copyProperties(problemDO, problemOutputListDTO);
        problemOutputListDTO.setOptionDTOList(problemDO.getOptionDOList()
                .stream().map(optionDO -> {
                    OptionDTO optionDTO = new OptionDTO();
                    BeanUtils.copyProperties(optionDO, optionDTO);
                    return optionDTO;
                }).collect(Collectors.toList()));
        return problemOutputListDTO;
    }

    /**
     * 生成1道随机题
     * 设置redis key为当前用户id ，value为生成的题目
     *
     * @return
     */
    @Override
    public ServerResponse list() {
        //每次调用随机从题库中查询出1道题返回 并设置在redis中
        //是否正在进行考试
        CurrentUser currentUser = CurrentUser.getCurrentUser();
        Boolean hasKey = redisTemplate.hasKey(String.format(QuizConst.QUIZ_RECORD_PREFIX,
                currentUser.getId()));
        if (hasKey == null || !hasKey) {
            return ServerResponse.createByErrorMessage("您当前不在答题状态");
        }
        //去Redis里面中看看是不是已经有题目了，如果已经有题目了 返回错误
        ProblemDO problemDO = problemRedisTemplate.opsForValue().get(String.format(QuizConst.QUIZ_PROBLEM_LIST_PREFIX
                , currentUser.getId()));
        if (problemDO != null) {
            return ServerResponse.createByErrorMessage("您还有没有答完的题目哦");
        }
        //生成题目和选项
        int count = problemMapper.selectCount();
        Random random = new Random();
        int index = random.nextInt(count);
        ProblemDO problem = optionMapper.selectCompleteProblem(index);
        log.info("【本次随机生成的题目】{}", problem);
        //设置到Redis中
        problemRedisTemplate.opsForValue().set(String.format(QuizConst.QUIZ_PROBLEM_LIST_PREFIX
                , currentUser.getId()),problem,QuizConst.PROBLEM_EXPIRES_SECONDS, TimeUnit.SECONDS);
        //将ProblemDO转为ProblemOutputListDTO
        return ServerResponse.createBySuccess(
                buildProblemOutputDTO(problem));
    }


    /**
     * 要加入计时功能
     * 首先判断是否处于答题状态
     * 然后判断题目是不是为null -》 答题时间已经结束不通过
     * 不为null 判断是否正确 正确 更细分数 入库 错误 入库
     *
     * @param pid
     * @param optionId
     * @return
     */
    @Transactional
    @Override
    public ServerResponse validate(Integer pid, List<Integer> optionId) throws JsonProcessingException {
        CurrentUser currentUser = CurrentUser.getCurrentUser();
        Integer rid = redisTemplate.opsForValue().get(String.format(QuizConst.QUIZ_RECORD_PREFIX,
                currentUser.getId()));
        if (rid == null) {
            return ServerResponse.createByErrorMessage("您当前不在答题状态");
        }
        ProblemDO problemDO = problemRedisTemplate.opsForValue().get(String.format(QuizConst.QUIZ_PROBLEM_LIST_PREFIX
                , currentUser.getId()));
        if (problemDO == null ) {
            Answer answer = new Answer();
            answer.setCorrect(false)
                    .setPid(pid)
                    .setRid(rid)
                    .setUid(currentUser.getId())
                    .setOptionId(JacksonUtil.bean2Json(Lists.newArrayList()));
            answerMapper.insert(answer);
            return ServerResponse.createByErrorMessage("该题目答题已结束");
        }
        //答非所问
        if(!problemDO.getId().equals(pid)){
            return ServerResponse.createByErrorMessage("该题目答题已结束");
        }
        //判断答题的结果
        Set<Integer> userOptionIds = new HashSet<>(optionId);
        Set<Integer> correctOptionIds = new HashSet<>();
        for (OptionDO optionDO : problemDO.getOptionDOList()) {
            if (optionDO.getCorrect()) {
                correctOptionIds.add(optionDO.getId());
            }
        }
        //两个集合互相包含
        boolean correct = false;
        if (userOptionIds.containsAll(correctOptionIds) && correctOptionIds.containsAll(userOptionIds)) {
            correct = true;
        }
        //将用户的回答入库
        Answer answer = new Answer();
        answer.setCorrect(correct)
                .setPid(pid)
                .setRid(rid)
                .setUid(currentUser.getId())
                .setOptionId(JacksonUtil.bean2Json(optionId));
        answerMapper.insert(answer);
        //更新一下分数
        if(correct){
            recordMapper.updateScoreByPrimaryUid(rid,currentUser.getId()) ;
        }
        problemRedisTemplate.delete(String.format(QuizConst.QUIZ_PROBLEM_LIST_PREFIX
                , currentUser.getId()));
        return ServerResponse.createBySuccess(new ValidateResultDTO(correct, correctOptionIds));
    }

    @Override
    public ServerResponse getResult() {
        //计算出当前用户的分数，并且将redis中设置的key移除(包括rid以及problemDO对象)
        CurrentUser currentUser = CurrentUser.getCurrentUser();
        log.info("[测试]{}",currentUser);
        Integer rid = redisTemplate.opsForValue().get(String.format(QuizConst.QUIZ_RECORD_PREFIX,
                currentUser.getId()));
        if (rid == null) {
            return ServerResponse.createByErrorMessage("您当前不在答题状态");
        }
        endQuiz() ;
        int score = recordMapper.selectScoreByPrimaryKey(rid) ;
        return ServerResponse.createBySuccess(score);
    }

    private void endQuiz(){
        CurrentUser currentUser = CurrentUser.getCurrentUser() ;
        //删除redis中的key
        redisTemplate.delete(String.format(QuizConst.QUIZ_RECORD_PREFIX,
                currentUser.getId()));
        problemRedisTemplate.delete(String.format(QuizConst.QUIZ_PROBLEM_LIST_PREFIX
                , currentUser.getId()));
    }

    @Override
    public ServerResponse rank(PageInputDTO page) {
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        List<RankListDTO> rankList = recordMapper.rank();
        return ServerResponse.createBySuccess(rankList);
    }

/*
    @Deprecated
    public ServerResponse startQuiz2() {
        //开始答题
        //判断当前用户最近的quiz_record记录中的score是不是为null
        CurrentUser currentUser = CurrentUser.getCurrentUser();
        Record recentRecord = recordMapper.selectRecentRecordByUid(currentUser.getId());
        if (recentRecord != null && recentRecord.getScore() == null) {//可能是掉线了 然后之前的题目没有答完
            //再设置一次
            redisTemplate.opsForValue().set(String.format(QuizConst.QUIZ_RECORD_PREFIX,
                    currentUser.getId()), recentRecord.getId());
            return ServerResponse.createBySuccess(recentRecord);
        }
        //创建一个没有score的Record
        Record record = new Record();
        record.setUid(currentUser.getId());
        int rows = recordMapper.insert(record);
        if (rows < 1) {
            return ServerResponse.createByErrorMessage("创建答题记录失败");
        }
        //创建成功之后还需要在Redis中设置一个答题用的List以及一个设置以下rid
        redisTemplate.opsForValue().set(String.format(QuizConst.QUIZ_RECORD_PREFIX,
                currentUser.getId()), record.getId());
        return ServerResponse.createBySuccess();
    }*/


   /* @Deprecated
    public ServerResponse list2() {
        //每次调用随机从题库中查询出5道题返回 并设置在redis中
        //是否正在进行考试
        CurrentUser currentUser = CurrentUser.getCurrentUser();
        Boolean hasKey = redisTemplate.hasKey(String.format(QuizConst.QUIZ_RECORD_PREFIX,
                currentUser.getId()));
        if (hasKey == null || !hasKey) {
            return ServerResponse.createByErrorMessage("您当前不在答题状态");
        }
        //去Redis里面中看看是不是已经有题目了，如果已经有题目了 返回错误
        Long size = problemRedisTemplate.opsForList().size(String.format(QuizConst.QUIZ_PROBLEM_LIST_PREFIX
                , currentUser.getId()));
        log.info("【redis中的题目数目为】{}", size);
        if (size != null && size > 0) {
            return ServerResponse.createByErrorMessage("您还有没有答完的题目哦");
        }
        //生成题目和选项
        //先查询出总条数
        int count = problemMapper.selectCount();
        Set<ProblemDO> set = new HashSet<>();
        Random random = new Random();
        int selectCount = Math.min(count, QuizConst.RESPONSE_PROBLEM_COUNT);
        while (set.size() < selectCount) {
            //现在做的是只返回一道题 ，之后可能是多道
            int pages = count % selectCount == 0?count/selectCount:count/selectCount + 1 ; //现在是只传回一个，之后可能是多个的
            int index = random.nextInt(pages) + 1;
            PageHelper.startPage(index, selectCount);
            List<ProblemDO> problemDOList = optionMapper.selectCompleteProblemByPrimaryKey();
            set.addAll(problemDOList);
        }
        List<ProblemDO> list = new ArrayList<>(set);
        log.info("【本次随机生成的题目】{}", list);
        //设置到Redis中
        if (!list.isEmpty()) {
            problemRedisTemplate.opsForList().leftPushAll(String.format(QuizConst.QUIZ_PROBLEM_LIST_PREFIX
                    , currentUser.getId()), list);
        }
        //将ProblemDO转为ProblemOutputListDTO
        return ServerResponse.createBySuccess(buildProblemOutputDTO(list));
    }*/

/*    @Deprecated
    private List<ProblemOutputListDTO> buildProblemOutputDTO(List<ProblemDO> problemDOList) {
        return problemDOList.stream().map(problemDO -> {
            ProblemOutputListDTO problemOutputListDTO = new ProblemOutputListDTO();
            BeanUtils.copyProperties(problemDO, problemOutputListDTO);
            problemOutputListDTO.setOptionDTOList(problemDO.getOptionDOList()
                    .stream().map(optionDO -> {
                        OptionDTO optionDTO = new OptionDTO();
                        BeanUtils.copyProperties(optionDO, optionDTO);
                        return optionDTO;
                    }).collect(Collectors.toList()));
            return problemOutputListDTO;
        }).collect(Collectors.toList());
    }*/

/*
   @Deprecated
    public ServerResponse validate2(Integer pid, List<Integer> optionId) {
        CurrentUser currentUser = CurrentUser.getCurrentUser();
        Integer rid = redisTemplate.opsForValue().get(String.format(QuizConst.QUIZ_RECORD_PREFIX,
                currentUser.getId()));
        if (rid == null) {
            return ServerResponse.createByErrorMessage("您当前不在答题状态");
        }
        ProblemDO problemDO = problemRedisTemplate.opsForList().rightPop(String.format(QuizConst.QUIZ_PROBLEM_LIST_PREFIX
                , currentUser.getId()));
        if (problemDO == null || !problemDO.getId().equals(pid)) {
            return ServerResponse.createByErrorMessage("请按照顺序答题");
        }
        //判断答题的结果
        Set<Integer> userOptionIds = new HashSet<>(optionId);
        Set<Integer> correctOptionIds = new HashSet<>();
        for (OptionDO optionDO : problemDO.getOptionDOList()) {
            if (optionDO.getCorrect()) {
                correctOptionIds.add(optionDO.getId());
            }
        }
        //两个集合互相包含
        boolean correct = false;
        if (userOptionIds.containsAll(correctOptionIds) && correctOptionIds.containsAll(userOptionIds)) {
            correct = true;
        }
        //将用户的回答入库
        Answer answer = new Answer();
        answer.setCorrect(correct)
                .setPid(pid)
                .setRid(rid)
                .setUid(currentUser.getId());
        answerMapper.insert(answer);
        return ServerResponse.createBySuccess(new ValidateResultDTO(correct, correctOptionIds));
    }*/

   /* @Deprecated
    public ServerResponse getResult2() {
        //计算出当前用户的分数，并且将redis中设置的key移除(包括rid以及problemDO对象)
        CurrentUser currentUser = CurrentUser.getCurrentUser();
        Integer rid = redisTemplate.opsForValue().get(String.format(QuizConst.QUIZ_RECORD_PREFIX,
                currentUser.getId()));
        if (rid == null) {
            return ServerResponse.createByErrorMessage("您当前不在答题状态");
        }
        int score = answerMapper.selectCountByRidUid(rid, currentUser.getId(), true);
        //更新数据库的score信息（必须先更新数据库再更新Redis）
        recordMapper.updateScoreByPrimaryUid(rid, currentUser.getId(), score);
        //删除redis中的key
        redisTemplate.delete(String.format(QuizConst.QUIZ_RECORD_PREFIX,
                currentUser.getId()));
        problemRedisTemplate.delete(String.format(QuizConst.QUIZ_PROBLEM_LIST_PREFIX
                , currentUser.getId()));
        return ServerResponse.createBySuccess(score);
    }*/

}
