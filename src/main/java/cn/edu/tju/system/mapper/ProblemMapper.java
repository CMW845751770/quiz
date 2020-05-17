package cn.edu.tju.system.mapper;

import cn.edu.tju.system.entity.Problem;

public interface ProblemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Problem record);

    int insertSelective(Problem record);

    Problem selectByPrimaryKey(Integer id);

    int selectCount() ;
}