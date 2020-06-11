package cn.edu.tju.system.mapper;

import cn.edu.tju.back.dto.output.ErrorRankInfoOptionOutputDTO;
import cn.edu.tju.system.entity.Option;
import cn.edu.tju.system.entity.OptionDO;
import cn.edu.tju.system.entity.ProblemDO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OptionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Option record);

    int insertSelective(Option record);

    Option selectByPrimaryKey(Integer id);

    List<ProblemDO> selectCompleteProblemList() ;

    ProblemDO selectCompleteProblem(@Param("pageNum")Integer pageNum) ;

    OptionDO selectByPid(@Param("pid")Integer pid) ;

    List<ErrorRankInfoOptionOutputDTO> selectOptionByPid(@Param("pid")Integer pid) ;
}