package cn.edu.tju.back.dto.output;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/30 13:25
 */
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class ErrorRankInfoProblemOutputDTO {

    private String description ;

    private List<ErrorRankInfoOptionOutputDTO> optionList ;
}
