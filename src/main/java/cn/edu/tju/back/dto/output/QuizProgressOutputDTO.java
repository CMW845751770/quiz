package cn.edu.tju.back.dto.output;

import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/14 21:20
 */
@Data
@ToString
@Accessors(chain = true)
public class QuizProgressOutputDTO {

    private Integer totalCount ;

    private Double correctRate ;

    private Double avgScore ;
}
