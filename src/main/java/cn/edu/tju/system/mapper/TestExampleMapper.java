package cn.edu.tju.system.mapper;

import cn.edu.tju.system.entity.TestExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TestExampleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TestExample record);

    int insertSelective(TestExample record);

    TestExample selectByPrimaryKey(Integer id);

    List<TestExample> selectByPid(@Param("pid")Integer pid) ;
}