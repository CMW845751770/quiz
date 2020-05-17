package cn.edu.tju.system.dto.output;

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
public class OJProblemListDTO {

    private Integer id ;

    private String title ;

    private Integer typeId ;

    private boolean pass ;

    private Short difficulty ;

    private Date createTime ;

    private Date updateTime ;
}
