package cn.edu.tju.system.dto.output;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 13:08
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Accessors(chain = true)
public class UserOutputDTO {

    private Integer id ;

    private String username;

    private String email ;

    private String role;

    private String status;
}
