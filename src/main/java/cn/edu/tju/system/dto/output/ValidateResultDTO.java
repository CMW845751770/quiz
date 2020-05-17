package cn.edu.tju.system.dto.output;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Set;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/10 15:57
 */
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ValidateResultDTO {

    private boolean result ;

    private Set<Integer> correctOptionIds ;
}
