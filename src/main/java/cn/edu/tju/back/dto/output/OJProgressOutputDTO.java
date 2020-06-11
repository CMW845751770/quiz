package cn.edu.tju.back.dto.output;

import lombok.Data;
import lombok.ToString;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/14 20:20
 */
@Data
@ToString
public class OJProgressOutputDTO {

    private Integer id ;

    private Integer daysFromNow ;

    private Boolean pass ;

    private String title ;
}
