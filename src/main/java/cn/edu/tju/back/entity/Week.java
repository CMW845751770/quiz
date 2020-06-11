package cn.edu.tju.back.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
 * @Author: CMW天下第一
 * @Date: 2020/6/6 11:21
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@ToString
public class Week implements Serializable {

    private static final long serialVersionUID = 6499771958451709580L;
    private int weekNumber ;
    private List<WeekDay> weekDays ;
}
