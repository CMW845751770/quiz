package cn.edu.tju.back.dto.output;

import com.fasterxml.jackson.annotation.JsonFormat;
import javafx.util.Pair;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * @Author: CMW天下第一
 * @Date: 2020/6/2 16:37
 */
@Data
@ToString
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
public class ErrorInfoOutputDTO {

    private Boolean pass ;

    private String title ;

    private String info  ;

    private Integer passTestExampleCount ;

    private Integer totalTestExampleCount ;

    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date submitDate ;
}
