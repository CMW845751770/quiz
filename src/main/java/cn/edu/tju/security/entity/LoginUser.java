package cn.edu.tju.security.entity;

import lombok.Data;
import lombok.ToString;


/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 10:47
 */
@Data
@ToString
public class LoginUser {

    private String email;
    private String password;
    private Boolean rememberMe;

}
