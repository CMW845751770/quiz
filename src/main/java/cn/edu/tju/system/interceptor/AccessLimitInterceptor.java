package cn.edu.tju.system.interceptor;

import cn.edu.tju.system.utils.IPUtils;
import cn.edu.tju.system.utils.JacksonUtil;
import cn.edu.tju.system.annotations.AccessLimit;
import cn.edu.tju.system.base.ResponseCode;
import cn.edu.tju.system.base.ServerResponse;
import cn.edu.tju.system.base.constant.AccessLimitConst;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.concurrent.TimeUnit;

/**
 * ip限流
 * @Author: CMW天下第一
 * @Date: 2020/5/7 12:31
 */
@Component
public class AccessLimitInterceptor extends HandlerInterceptorAdapter {

    @Resource
    private StringRedisTemplate stringRedisTemplate ;
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(handler instanceof HandlerMethod){
            HandlerMethod hm = (HandlerMethod) handler ;
            AccessLimit accessLimit = hm.getMethodAnnotation(AccessLimit.class);
            if(accessLimit == null){
                return true ;
            }
            int seconds = accessLimit.seconds() ;
            //对相同ip访问的uri进行限流
            String key = String.format(AccessLimitConst.ACCESS_LIMIT_PREFIX, IPUtils.getRealIP(request),request.getRequestURI()) ;
            String accessLimitValue = stringRedisTemplate.opsForValue().get(key);
            if(accessLimitValue == null){
                stringRedisTemplate.opsForValue().set(key, AccessLimitConst.ACCESS_LIMIT_VALUE,
                        seconds, TimeUnit.SECONDS);
            }else{
                response.setContentType("application/json");
                String output = JacksonUtil.bean2Json(
                        ServerResponse.createByErrorCodeMessage(ResponseCode.RATE_LIMIT)
                ) ;
                response.getWriter().write(output);
                return false ;
            }
        }
        return true ;
    }
}
