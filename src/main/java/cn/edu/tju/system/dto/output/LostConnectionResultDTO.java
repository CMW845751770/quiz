package cn.edu.tju.system.dto.output;

import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/14 14:07
 */
@Data
@ToString
@Accessors(chain = true)
public class LostConnectionResultDTO {

    private ProblemOutputListDTO problemOutputDTO ;

    private Integer score ;
}
