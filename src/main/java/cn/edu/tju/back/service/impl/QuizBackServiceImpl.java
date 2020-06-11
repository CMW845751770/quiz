package cn.edu.tju.back.service.impl;

import cn.edu.tju.back.dto.input.PageBackInputDTO;
import cn.edu.tju.back.dto.output.*;
import cn.edu.tju.back.service.QuizBackService;
import cn.edu.tju.back.service.UserBackService;
import cn.edu.tju.security.entity.CurrentUser;
import cn.edu.tju.system.base.ServerResponse;
import cn.edu.tju.system.dto.output.RankListDTO;
import cn.edu.tju.system.mapper.AnswerMapper;
import cn.edu.tju.system.mapper.OptionMapper;
import cn.edu.tju.system.mapper.ProblemMapper;
import cn.edu.tju.system.mapper.RecordMapper;
import cn.edu.tju.system.utils.JacksonUtil;
import com.fasterxml.jackson.core.type.TypeReference;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/14 18:31
 */
@Service
@Transactional
@Slf4j
public class QuizBackServiceImpl implements QuizBackService {

    @Resource
    private RecordMapper recordMapper;
    @Resource
    private AnswerMapper answerMapper;
    @Resource
    private ProblemMapper problemMapper;
    @Resource
    private OptionMapper optionMapper;

    @Override
    public ServerResponse myRank() {
        List<RankListDTO> rankListDTOList = recordMapper.myRank();
        int rank = 0;
        CurrentUser currentUser = CurrentUser.getCurrentUser();
        for (RankListDTO rankListDTO : rankListDTOList) {
            rank++;
            if (rankListDTO.getUid().equals(currentUser.getId())) {
                break;
            }
        }
        List<Integer> scoreList = recordMapper.selectLastFiveScores(currentUser.getId());
        MyQuizRankInfoOutputDTO rankInfo = new MyQuizRankInfoOutputDTO();
        rankInfo.setRank(rank)
                .setScoreList(scoreList)
                .setTotalUser(rankListDTOList.size());
        return ServerResponse.createBySuccess(rankInfo);
    }

    @Override
    public ServerResponse progress() {
        CurrentUser currentUser = CurrentUser.getCurrentUser();
        Integer totalCount = answerMapper.selectProblemCount(currentUser.getId());
        Double correctRate = answerMapper.selectCorrectRate(currentUser.getId());
        Double avgScore = recordMapper.selectAvgScore(currentUser.getId());
        QuizProgressOutputDTO progressOutputDTO = new QuizProgressOutputDTO();
        progressOutputDTO.setAvgScore(avgScore)
                .setCorrectRate(correctRate)
                .setTotalCount(totalCount);
        return ServerResponse.createBySuccess(progressOutputDTO);
    }

    @Override
    public ServerResponse errorRank(PageBackInputDTO page) {
        PageHelper.startPage(page.getPageNum(), page.getPageSize());
        List<ErrorRankInfoOutputDTO> list = answerMapper.selectErrorRankInof();
        return ServerResponse.createBySuccess(list.stream().map(error -> {
            error.setAccuracy( new BigDecimal(1- error.getErrorRate()).setScale(2, BigDecimal.ROUND_HALF_UP)
                    .doubleValue());
            return error ;
        }).collect(Collectors.toList()));
    }

    @Override
    public ServerResponse errorRankProblem(Integer pid) throws IOException {
        //查询出题干和选项
        ErrorRankInfoProblemOutputDTO errorRankInfoProblemOutputDTO = new ErrorRankInfoProblemOutputDTO();
        errorRankInfoProblemOutputDTO.setDescription(problemMapper.selectDescriptionByPrimaryKey(pid));
        List<ErrorRankInfoOptionOutputDTO> list = optionMapper.selectOptionByPid(pid);
        List<String> optionIdList = answerMapper.selectOptionIdByPid(pid);
        Map<Integer, Integer> map = new HashMap<>();
        for (ErrorRankInfoOptionOutputDTO option : list) {
            map.put(option.getOptionId(), 0);
        }
        for (String str : optionIdList) {
            //如果这道题目没有被回答过
            if(str == null){
                break;
            }
            List<Integer> optionIds = JacksonUtil.json2BeanT(str, new TypeReference<List<Integer>>() {
            });
            log.info("查询出的选项{}",optionIds);
            for(Integer optionId : optionIds){
                map.put(optionId,map.get(optionId) + 1) ;
            }
        }
        Integer total = 0  ;
        for(Integer count : map.values()){
            total += count ;
        }
        for(ErrorRankInfoOptionOutputDTO option : list){
            option.setChooseRate(total == 0 ?0.0:map.get(option.getOptionId()) / (double)total) ;
            option.setChooseCount(map.get(option.getOptionId())) ;
        }
        errorRankInfoProblemOutputDTO.setOptionList(list) ;
        return ServerResponse.createBySuccess(errorRankInfoProblemOutputDTO);
    }
}
