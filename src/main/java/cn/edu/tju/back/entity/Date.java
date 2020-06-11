package cn.edu.tju.back.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @Author: CMW天下第一
 * @Date: 2020/6/6 11:16
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
public class Date implements Serializable {

    private static final long serialVersionUID = 3146169590426385789L;
    private int day ;

    private int month ;

    private int year ;

    @Override
    public String toString() {
        return year+"-"+(month+1)+"-"+day ;
    }
}
