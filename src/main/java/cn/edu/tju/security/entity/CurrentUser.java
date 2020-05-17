package cn.edu.tju.security.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import java.util.Collection;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 10:47
 */
@Component
@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class CurrentUser {

    private Integer id ;

    private String email;

    private Collection<? extends GrantedAuthority> authorities;

    public static CurrentUser getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() != null) {
            return (CurrentUser) authentication.getPrincipal();
        }
        return null;
    }
}
