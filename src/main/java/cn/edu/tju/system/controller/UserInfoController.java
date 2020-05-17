package cn.edu.tju.system.controller;

import cn.edu.tju.system.base.ServerResponse;
import cn.edu.tju.system.entity.User;
import cn.edu.tju.system.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/15 22:07
 */
@RequestMapping("/api/user")
@RestController
public class UserInfoController {

    @Resource
    private UserService userServiceImpl ;

    /**
     * 查看个人信息
     * @return
     */
    @GetMapping("me")
    public ServerResponse me(){
        return userServiceImpl.me() ;
    }

    @PostMapping("username")
    public ServerResponse updateUsername(String username){
        return userServiceImpl.updateUsername(username) ;
    }
}
