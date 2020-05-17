package cn.edu.tju.system.entity;

import lombok.*;
import java.util.List;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/10 16:12
 * 数据库查询出来的对象
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode(of = "id")
public class ProblemDO {

    private Integer id;

    private String description;

    private Integer typeId;

    private List<OptionDO> optionDOList ;
}
