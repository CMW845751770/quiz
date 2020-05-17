package cn.edu.tju.security.controller;

import cn.edu.tju.system.annotations.AccessLimit;
import cn.edu.tju.system.base.ServerResponse;
import cn.edu.tju.system.dto.input.UserInputDTO;
import cn.edu.tju.system.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;
import javax.validation.Valid;


/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 11:16
 */
@Validated
@RestController
@RequestMapping("/auth")
public class AuthController {

    @Resource
    private UserService userServiceImpl;

    @PostMapping("/register")
    @AccessLimit(seconds = 40)
    public ServerResponse registerUser(@Valid @RequestBody UserInputDTO user) throws JsonProcessingException {
        return userServiceImpl.register(user) ;
    }

    @PostMapping("/activate")
    public ServerResponse activate(String token){
        return userServiceImpl.activate(token) ;
    }
}
