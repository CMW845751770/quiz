package cn.edu.tju.back.service.impl;

import cn.edu.tju.back.dto.input.PageBackInputDTO;
import cn.edu.tju.back.dto.output.MyOJRankInfoOutputDTO;
import cn.edu.tju.back.dto.output.OJProblemPassCountDTO;
import cn.edu.tju.back.dto.output.OJProgressOutputDTO;
import cn.edu.tju.back.service.OJService;
import cn.edu.tju.back.service.UserBackService;
import cn.edu.tju.security.entity.CurrentUser;
import cn.edu.tju.system.base.ServerResponse;
import cn.edu.tju.system.dto.input.PageInputDTO;
import cn.edu.tju.system.dto.output.OJRankListDTO;
import cn.edu.tju.system.enums.OJProblemDifficultyEnum;
import cn.edu.tju.system.mapper.OJRecordMapper;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/14 15:02
 */
@Service
@Slf4j
public class OJServiceImpl implements OJService {

    @Resource
    private OJRecordMapper ojRecordMapper ;
    @Resource
    private UserBackService userBackServiceImpl ;

    @Override
    public ServerResponse myRank() {
        List<OJRankListDTO> ojRankListDTOList = ojRecordMapper.myRank();
        CurrentUser currentUser = CurrentUser.getCurrentUser() ;
        int rank = 0 ;
        for (OJRankListDTO ojRankListDTO : ojRankListDTOList){
            rank ++ ;
            if(ojRankListDTO.getUid().equals(currentUser.getId())){
                break;
            }
        }
        int easyCount = ojRecordMapper.selectPassCountByUidDifficulty(currentUser.getId(),
                true, OJProblemDifficultyEnum.EASY.getDifficulty()) ;
        int mediumCount = ojRecordMapper.selectPassCountByUidDifficulty(currentUser.getId(),
                true,OJProblemDifficultyEnum.MEDIUM.getDifficulty()) ;
        int hardCount = ojRecordMapper.selectPassCountByUidDifficulty(currentUser.getId(),
                true,OJProblemDifficultyEnum.HARD.getDifficulty()) ;
        MyOJRankInfoOutputDTO rankInfo = new MyOJRankInfoOutputDTO() ;
        rankInfo.setRank(rank)
                .setOjProblemPassCountDTO(new OJProblemPassCountDTO()
                .setEasy(easyCount)
                .setMedium(mediumCount)
                .setHard(hardCount))
                .setTotalUser(userBackServiceImpl.getTotalUserCount());
        return ServerResponse.createBySuccess(rankInfo);
    }

    @Override
    public ServerResponse progress(PageBackInputDTO page) {
        PageHelper.startPage(page.getPageNum(),page.getPageSize()) ;
        List<OJProgressOutputDTO> progressOutputDTOList = ojRecordMapper.selectProgress();
        return ServerResponse.createBySuccess(progressOutputDTOList);
    }
}
