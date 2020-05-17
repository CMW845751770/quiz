package cn.edu.tju.system.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/10 16:16
 */
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class OptionDO {
    private Integer id;

    private String description;

    private Boolean correct;
}
