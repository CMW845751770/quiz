package cn.edu.tju.security.service;

import cn.edu.tju.security.entity.JwtUser;
import cn.edu.tju.system.entity.User;
import cn.edu.tju.system.service.UserService;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 10:47
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService {


    @Resource
    private UserService userServiceImpl ;

    @Override
    public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
        User user = userServiceImpl.findUserByEmail(name);
        if(user == null){
            throw new UsernameNotFoundException("no user found with email "+name) ;
        }
        return new JwtUser(user);
    }

}