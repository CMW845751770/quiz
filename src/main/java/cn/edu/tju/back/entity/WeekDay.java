package cn.edu.tju.back.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @Author: CMW天下第一
 * @Date: 2020/6/6 11:20
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@ToString
public class WeekDay implements Serializable {

    private static final long serialVersionUID = -583506399393622962L;
    private int index ;

    private Date date ;

    private String dateString ;

    private Frequency frequencyData ;
}
