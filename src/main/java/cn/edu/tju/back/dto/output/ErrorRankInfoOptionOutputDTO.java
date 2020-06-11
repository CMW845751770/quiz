package cn.edu.tju.back.dto.output;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/30 13:25
 */
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class ErrorRankInfoOptionOutputDTO {

    private Integer optionId ;

    private String description ;

    private Double chooseRate ;

    private Integer chooseCount ;
}
