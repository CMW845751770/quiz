package cn.edu.tju.system.enums;

import com.fasterxml.jackson.annotation.JsonCreator;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 11:34
 */
@AllArgsConstructor
@NoArgsConstructor
public enum UserStatus {
    ACTIVATED(true,"ACTIVATED"),
    NOT_ACTIVATED(false,"NOT_ACTIVATED");

    private Boolean enable ;
    private String status;

    public Boolean getEnable() {
        return enable;
    }

    public String getStatus() {
        return status;
    }

    public static String fromEnable(Boolean enable) {
        for (UserStatus type : UserStatus.values()) {
            if (type.getEnable().equals(enable)) {
                return type.getStatus();
            }
        }
        return null;
    }
}
