package cn.edu.tju.system.dto.output;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/8 16:34
 */
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class OJRankListDTO {

    private Integer uid;
    private String username ;
    private Integer passCount ;
}
