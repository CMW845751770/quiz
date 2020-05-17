package cn.edu.tju.back.dto.output;

import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/14 15:10
 */
@Data
@ToString
@Accessors(chain = true)
public class MyOJRankInfoOutputDTO {

    private Integer rank ;

    private OJProblemPassCountDTO ojProblemPassCountDTO ;

    private Integer totalUser ;
}
