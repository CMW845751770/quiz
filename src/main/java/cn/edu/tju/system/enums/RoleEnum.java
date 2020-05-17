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
public enum RoleEnum {
    USER(1,"USER"),
    ADMIN(2,"ADMIN");

    private Integer roleId ;
    private String status;

    public Integer getRoleId() {
        return roleId;
    }

    public String getStatus() {
        return status;
    }

    public static String fromRoleId(Integer roleId) {
        for (RoleEnum type : RoleEnum.values()) {
            if (type.getRoleId().equals(roleId)) {
                return type.getStatus();
            }
        }
        return null;
    }
}
