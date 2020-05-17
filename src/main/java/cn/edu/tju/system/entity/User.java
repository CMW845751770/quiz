package cn.edu.tju.system.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import java.util.Date;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 11:08
 */
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class User {

    private Integer id;

    private String username;

    private String password;

    private String email ;

    private Integer roleid;

    private Boolean status;

    private Date createTime ;

    private Date updateTime ;
}
