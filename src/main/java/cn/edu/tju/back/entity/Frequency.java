package cn.edu.tju.back.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @Author: CMW天下第一
 * @Date: 2020/6/6 11:19
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@ToString
public class Frequency implements Serializable {

    private static final long serialVersionUID = 1890290864462251182L;
    private int count ;
}
