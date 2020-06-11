package cn.edu.tju.back.dto.output;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/30 11:18
 */
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ErrorRankInfoOutputDTO {

    private Integer pid ;

    private String description ;

    private Integer typeId ;

    private Integer totalCount ;

    private Double accuracy ;

    @JsonIgnore
    private Double errorRate ;
}
