package cn.edu.tju.system.dto.output;

import lombok.*;

import java.util.List;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/9 18:02
 * 返回给前端的Problem对象
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ProblemOutputListDTO {

    private Integer id;

    private String description;

    private Integer typeId;

    private List<OptionDTO> optionDTOList ;
}
