package cn.edu.tju.back.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

/**
 * @Author: CMW天下第一
 * @Date: 2020/6/6 11:34
 */
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class SubmitInfo {

    private int count ;

    private Date date ;
}
