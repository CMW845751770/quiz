package cn.edu.tju.system.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.util.Date;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 18:20
 */
@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class OJProblem {

    private Integer id ;

    private String title ;

    private String description ;

    private Integer timeout ;

    private Integer typeId ;

    private Short difficulty ;

    private Date createTime ;

    private Date updateTime ;
}
