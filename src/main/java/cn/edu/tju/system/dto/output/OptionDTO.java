package cn.edu.tju.system.dto.output;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/9 18:07
 * 返回给前端的option对象
 */
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Data
public class OptionDTO {

    private Integer id;

    private String description;
}
