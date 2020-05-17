package cn.edu.tju.security.exception;

import cn.edu.tju.system.base.ResponseCode;
import cn.edu.tju.system.base.ServerResponse;
import cn.edu.tju.system.utils.JacksonUtil;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 10:47
 */
public class JWTAccessDeniedHandler implements AccessDeniedHandler {
    /**
     * 当用户尝试访问需要权限才能的REST资源而权限不足的时候，
     * 将调用此方法发送401响应以及错误信息
     */
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException {
        accessDeniedException.printStackTrace();
        accessDeniedException = new AccessDeniedException("Sorry you don not enough permissions to access it!");
        response.setContentType("application/json");
        response.getWriter().write(JacksonUtil.bean2Json(
                ServerResponse.createByErrorCodeMessage(ResponseCode.ACCESS_DENIED.getCode(),
                        accessDeniedException.getMessage())
        ));
    }
}
