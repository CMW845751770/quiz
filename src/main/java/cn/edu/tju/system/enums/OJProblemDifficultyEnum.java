package cn.edu.tju.system.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/12 13:56
 */
@AllArgsConstructor
@NoArgsConstructor
public enum  OJProblemDifficultyEnum {


    EASY(0,"easy"),
    MEDIUM(1,"medium") ,
    HARD(2,"hard") ;

    @Getter
    private Integer difficulty ;
    @Getter
    private String description ;


}
