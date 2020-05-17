package cn.edu.tju.system.mapper;

import cn.edu.tju.system.dto.output.RankListDTO;
import cn.edu.tju.system.entity.Record;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RecordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Record record);

    int insertSelective(Record record);

    Record selectByPrimaryKey(Integer id);

    Record selectRecentRecordByUid(@Param("uid") Integer uid) ;

    int updateScoreByPrimaryUid(@Param("id")Integer id , @Param("uid")Integer uid) ;

    List<RankListDTO> rank() ;

    int selectScoreByPrimaryKey(@Param("id")Integer id) ;

    List<RankListDTO> myRank() ;

    List<Integer> selectLastFiveScores(@Param("uid")Integer uid) ;

    Double selectAvgScore(@Param("uid")Integer uid) ;
}