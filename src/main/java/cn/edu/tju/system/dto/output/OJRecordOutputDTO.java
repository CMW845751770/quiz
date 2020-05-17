package cn.edu.tju.system.dto.output;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/8 15:30
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Accessors(chain = true)
public class OJRecordOutputDTO {

    private Boolean pass;

    private BigDecimal time;

    private String info; //通过则为OK 不通过返回错误信息
}
