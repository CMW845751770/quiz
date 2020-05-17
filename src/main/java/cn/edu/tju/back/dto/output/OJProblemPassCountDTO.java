package cn.edu.tju.back.dto.output;

import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/14 15:11
 */
@Data
@ToString
@Accessors(chain = true)
public class OJProblemPassCountDTO {
    private Integer easy ;

    private Integer medium ;

    private Integer hard ;

}
