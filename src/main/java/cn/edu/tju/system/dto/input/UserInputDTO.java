package cn.edu.tju.system.dto.input;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 11:16
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UserInputDTO {

    @NotBlank(message = "email 不能为空")
    @Email(message = "不支持的邮箱格式")
    private String email ;

    @NotBlank(message = "密码不能为空")
    @Size(min = 8,max = 12,message = "密码的长度应该在8和12之间")
    private String password ;
}
