package cn.edu.tju.security.exception;

import cn.edu.tju.system.base.ResponseCode;
import cn.edu.tju.system.base.ServerResponse;
import cn.edu.tju.system.utils.JacksonUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 10:47
 */
@Slf4j
public class JWTAuthenticationEntryPoint implements AuthenticationEntryPoint {
    /**
     * 当用户尝试访问需要权限才能的REST资源而不提供Token或者Token错误或者过期时，
     * 将调用此方法发送401响应以及错误信息
     */
    @Override
    public void commence(HttpServletRequest request,
                         HttpServletResponse response,
                         AuthenticationException authException) throws IOException {
        authException.printStackTrace();
        response.setContentType("application/json");
        response.getWriter().write(JacksonUtil.bean2Json(
                ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(),
                        authException.getMessage())
        ));
    }
}
