package cn.edu.tju.system.dto.input;

import lombok.Data;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/8 11:40
 * 用于controller中接收submit的对象
 */
@Data
public class OJProblemInputDTO {

    @NotNull(message = "id 不能为空")
    @Min(value = 1,message = "id 至少为1")
    private Integer id ;

    @NotBlank(message = "code 不能为空")
    private String code ;
}
