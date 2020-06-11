package cn.edu.tju.system.mapper;

import cn.edu.tju.system.entity.Problem;
import org.apache.ibatis.annotations.Param;

public interface ProblemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Problem record);

    int insertSelective(Problem record);

    Problem selectByPrimaryKey(Integer id);

    int selectCount() ;

    String selectDescriptionByPrimaryKey(@Param("id")Integer id) ;
}