package cn.edu.tju.back.dto.output;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * @Author: CMW天下第一
 * @Date: 2020/6/6 13:16
 */
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class SubmitRecordOutputDTO {

    private Integer days ;

    private Integer submitCount ;
}
