package cn.edu.tju.system.exception;

import cn.edu.tju.system.base.ResponseCode;
import cn.edu.tju.system.base.ServerResponse;
import org.springframework.validation.BindException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 11:16
 */
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    public ServerResponse handleValidationExceptions(
            MethodArgumentNotValidException ex) {
        return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(),
                ex.getBindingResult().getFieldError().getDefaultMessage()) ;
    }

    @ExceptionHandler(BindException.class)
    public ServerResponse handle(BindException ex) {
        return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(),
                ex.getBindingResult().getFieldError().getDefaultMessage()) ;
    }

    @ExceptionHandler(value = Exception.class)
    public ServerResponse handleExceptions(Exception e) {
        e.printStackTrace();
        return ServerResponse.createByErrorCodeMessage(ResponseCode.ERROR) ;
    }
}
