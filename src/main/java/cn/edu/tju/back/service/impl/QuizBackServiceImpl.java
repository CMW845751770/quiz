package cn.edu.tju.back.service.impl;

import cn.edu.tju.back.dto.output.MyQuizRankInfoOutputDTO;
import cn.edu.tju.back.dto.output.QuizProgressOutputDTO;
import cn.edu.tju.back.service.QuizBackService;
import cn.edu.tju.back.service.UserBackService;
import cn.edu.tju.security.entity.CurrentUser;
import cn.edu.tju.system.base.ServerResponse;
import cn.edu.tju.system.dto.output.RankListDTO;
import cn.edu.tju.system.mapper.AnswerMapper;
import cn.edu.tju.system.mapper.RecordMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/14 18:31
 */
@Service
@Transactional
public class QuizBackServiceImpl implements QuizBackService {

    @Resource
    private RecordMapper recordMapper;
    @Resource
    private UserBackService userBackServiceImpl;
    @Resource
    private AnswerMapper answerMapper;

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
                .setTotalUser(userBackServiceImpl.getTotalUserCount());
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
}
