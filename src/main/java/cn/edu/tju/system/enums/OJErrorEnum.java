package cn.edu.tju.system.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/8 17:34
 */
@AllArgsConstructor
@NoArgsConstructor
public enum OJErrorEnum {

    TIME_LIMIT_EXCEPTION("time limit exception"),
    COMPILATION_ERROR("compilation error") ;

    @Getter
    private String error ;
}
