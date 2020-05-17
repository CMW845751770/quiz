package cn.edu.tju.system.service;

import cn.edu.tju.system.base.ServerResponse;
import cn.edu.tju.system.dto.input.UserInputDTO;
import cn.edu.tju.system.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 11:08
 */
public interface UserService {

    ServerResponse register(UserInputDTO userInputDTO) throws JsonProcessingException;

    ServerResponse activate(String token) ;

    User findUserByEmail(String email) ;

    ServerResponse me() ;

    ServerResponse updateUsername(String username) ;
}
