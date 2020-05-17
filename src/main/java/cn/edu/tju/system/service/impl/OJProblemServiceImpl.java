package cn.edu.tju.system.service.impl;

import cn.edu.tju.security.entity.CurrentUser;
import cn.edu.tju.system.base.ServerResponse;
import cn.edu.tju.system.dto.input.OJProblemInputDTO;
import cn.edu.tju.system.dto.input.OJProblemSubmitDTO;
import cn.edu.tju.system.dto.input.PageInputDTO;
import cn.edu.tju.system.dto.output.OJProblemListDTO;
import cn.edu.tju.system.dto.output.OJProblemOutputDTO;
import cn.edu.tju.system.dto.output.OJRankListDTO;
import cn.edu.tju.system.dto.output.OJRecordOutputDTO;
import cn.edu.tju.system.entity.OJProblem;
import cn.edu.tju.system.entity.OJRecord;
import cn.edu.tju.system.entity.TestExample;
import cn.edu.tju.system.judge.Judge;
import cn.edu.tju.system.mapper.OJProblemMapper;
import cn.edu.tju.system.mapper.OJRecordMapper;
import cn.edu.tju.system.mapper.TestExampleMapper;
import cn.edu.tju.system.service.OJProblemService;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;


/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 18:32
 */
@Service
@Slf4j
public class OJProblemServiceImpl implements OJProblemService {

    @Resource
    private OJProblemMapper ojProblemMapper ;
    @Resource
    private TestExampleMapper testExampleMapper ;
    @Resource
    private OJRecordMapper ojRecordMapper ;

    @Override
    public ServerResponse problemList(PageInputDTO page) {
        CurrentUser currentUser = CurrentUser.getCurrentUser() ;
        PageHelper.startPage(page.getPageNum(),page.getPageSize()) ;
        List<OJProblemListDTO> ojProblemListDTOS = ojProblemMapper.selectAll(currentUser.getId());
        return ServerResponse.createBySuccess(ojProblemListDTOS) ;
    }

    @Override
    public ServerResponse showProblem(Integer id) {
        OJProblem ojProblem = ojProblemMapper.selectByPrimaryKey(id) ;
        OJProblemOutputDTO ojProblemOutputDTO = new OJProblemOutputDTO() ;
        if(ojProblem != null){
            BeanUtils.copyProperties(ojProblem,ojProblemOutputDTO) ;
        }
        return ServerResponse.createBySuccess(ojProblemOutputDTO);
    }

    @Override
    @Transactional
    public ServerResponse submit(OJProblemInputDTO ojProblem) {
        //查询出OJ题目 判断是否存在
        OJProblem problem = ojProblemMapper.selectByPrimaryKey(ojProblem.getId());
        if(problem == null){
            return ServerResponse.createByErrorMessage("没有找到此题") ;
        }
        //找出该题的所有的测试用例
        List<TestExample> testExampleList = testExampleMapper.selectByPid(problem.getId());
        //构造出输入输出
        OJProblemSubmitDTO ojProblemSubmitDTO = new OJProblemSubmitDTO() ;
        ojProblemSubmitDTO.setCode(ojProblem.getCode().replace(Judge.lineSeparator,""))
                            .setTimeout(problem.getTimeout())
                            .setTestExampleList(testExampleList)
                            .setPid(problem.getId());
        log.info("提交运行结果的题目为【{}】",ojProblemSubmitDTO);
        //提交返回运行结果
        OJRecord ojRecord =  Judge.judge(ojProblemSubmitDTO) ;
        log.info("题目【{}】提交的结果为【{}】",problem.getTitle(),ojRecord);
        //结果插入数据库
        ojRecordMapper.insert(ojRecord) ;
        //返回DTO对象
        return ServerResponse.createBySuccess(ojRecord2OJRecordOutputDTO(ojRecord));
    }

    @Override
    public ServerResponse rank(PageInputDTO page) {
        PageHelper.startPage(page.getPageNum(),page.getPageSize()) ;
        List<OJRankListDTO> rank = ojRecordMapper.rank();
        return ServerResponse.createBySuccess(rank);
    }

    private OJRecordOutputDTO ojRecord2OJRecordOutputDTO(OJRecord ojRecord){
        OJRecordOutputDTO ojRecordOutputDTO = new OJRecordOutputDTO() ;
        BeanUtils.copyProperties(ojRecord,ojRecordOutputDTO) ;
        return ojRecordOutputDTO ;
    }



    @Deprecated
    private String buildInput(List<TestExample> testExampleList){
        StringBuilder ans = new StringBuilder() ;
        int size = testExampleList.size() ;
        for(int i = 0 ; i < size - 1 ; i++){
            ans.append(testExampleList.get(i).getInput()) ;
            ans.append(Judge.BLANK_SPACE) ;
        }
        ans.append(testExampleList.get(size - 1).getInput()) ;
        return ans.toString() ;
    }

    @Deprecated
    private String buildOutput(List<TestExample> testExampleList){
        StringBuilder ans = new StringBuilder() ;
        int size = testExampleList.size() ;
        for(int i = 0 ; i < size - 1 ; i++){
            ans.append(testExampleList.get(i).getOutput()) ;
            ans.append(Judge.BLANK_SPACE) ;
        }
        ans.append(testExampleList.get(size - 1).getOutput()) ;
        return ans.toString() ;
    }
}
