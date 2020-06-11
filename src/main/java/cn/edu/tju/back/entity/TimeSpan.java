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
 * @Date: 2020/6/6 11:15
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Accessors(chain = true)
@ToString
public class TimeSpan implements Serializable {

    private static final long serialVersionUID = -495080013042059970L;
    private Date dateMin ;

    private Date dateMax ;

    private List<Week>  weeks ;

}
