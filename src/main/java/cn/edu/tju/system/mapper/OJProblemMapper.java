package cn.edu.tju.system.mapper;

import cn.edu.tju.system.dto.output.OJProblemListDTO;
import cn.edu.tju.system.entity.OJProblem;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;
import java.util.List;

public interface OJProblemMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OJProblem record);

    int insertSelective(OJProblem record);

    OJProblem selectByPrimaryKey(Integer id);

    List<OJProblemListDTO> selectAll(@Param("uid") Integer uid) ;
}