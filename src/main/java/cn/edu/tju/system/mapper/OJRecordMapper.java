package cn.edu.tju.system.mapper;

import cn.edu.tju.back.dto.output.OJProgressOutputDTO;
import cn.edu.tju.system.dto.output.OJRankListDTO;
import cn.edu.tju.system.entity.OJRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OJRecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OJRecord record);

    int insertSelective(OJRecord record);

    OJRecord selectByPrimaryKey(Integer id);

    List<OJRankListDTO> rank() ;

    List<OJRankListDTO> myRank() ;

    int selectPassCountByUidDifficulty(@Param("uid")Integer uid , @Param("pass") Boolean pass ,
                                       @Param("difficulty")Integer difficulty) ;

    List<OJProgressOutputDTO> selectProgress() ;
}