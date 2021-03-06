package cn.edu.tju.system.mapper;

import cn.edu.tju.back.dto.output.ErrorRankInfoOutputDTO;
import cn.edu.tju.system.entity.Answer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AnswerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Answer record);

    int insertSelective(Answer record);

    Answer selectByPrimaryKey(Integer id);

    Integer selectCountByRidUid(@Param("rid")Integer rid , @Param("uid") Integer uid, @Param("correct") Boolean correct) ;

    Integer selectProblemCount(@Param("uid")Integer uid) ;

    Double selectCorrectRate(@Param("uid")Integer uid) ;

    List<ErrorRankInfoOutputDTO> selectErrorRankInof() ;

    List<String> selectOptionIdByPid(@Param("pid")Integer pid) ;
}