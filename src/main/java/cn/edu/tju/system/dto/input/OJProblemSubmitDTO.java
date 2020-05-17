package cn.edu.tju.system.dto.input;

import cn.edu.tju.system.entity.TestExample;
import lombok.Data;
import lombok.ToString;
import lombok.experimental.Accessors;
import java.util.List;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/8 12:09
 */
@Data
@ToString
@Accessors(chain = true)
public class OJProblemSubmitDTO {

    private Integer pid ;

    private String code;

    private Integer timeout ;

    private List<TestExample> testExampleList;
}
