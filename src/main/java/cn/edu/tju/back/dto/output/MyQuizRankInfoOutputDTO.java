package cn.edu.tju.back.dto.output;

import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/14 18:39
 */
@Data
@ToString
@Accessors(chain = true)
public class MyQuizRankInfoOutputDTO {

    private Integer rank ;

    private List<Integer> scoreList ;

    private Integer totalUser ;
}
