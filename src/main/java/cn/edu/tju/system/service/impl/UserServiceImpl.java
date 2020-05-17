package cn.edu.tju.system.service.impl;

import cn.edu.tju.security.entity.CurrentUser;
import cn.edu.tju.system.base.ServerResponse;
import cn.edu.tju.system.base.constant.EmailConst;
import cn.edu.tju.system.dto.input.UserInputDTO;
import cn.edu.tju.system.dto.output.UserOutputDTO;
import cn.edu.tju.system.entity.User;
import cn.edu.tju.system.enums.RoleEnum;
import cn.edu.tju.system.enums.UserStatus;
import cn.edu.tju.system.mapper.UserMapper;
import cn.edu.tju.system.message.EmailMessageProducer;
import cn.edu.tju.system.service.UserService;
import cn.edu.tju.system.utils.JacksonUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.management.relation.RoleStatus;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 11:34
 */
@Service
@Slf4j
public class UserServiceImpl implements UserService {

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Resource
    private UserMapper userMapper;

    @Resource
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Resource
    private EmailMessageProducer emailMessageProducer;

    @Override
    @Transactional
    public ServerResponse register(UserInputDTO userInputDTO) throws JsonProcessingException {
        String email = userInputDTO.getEmail();
        String encodedPassword = bCryptPasswordEncoder.encode(userInputDTO.getPassword());
        User user = userMapper.selectByEmail(email);
        if (user == null) {
            //无此用户
            User insUser = new User();
            insUser.setEmail(email)
                    .setUsername(email)//用户名还是默认是邮箱吧
                    .setPassword(encodedPassword)
                    .setRoleid(RoleEnum.USER.getRoleId())
                    .setStatus(UserStatus.NOT_ACTIVATED.getEnable());
            int rows = userMapper.insert(insUser);
            if (rows < 1) {
                return ServerResponse.createByErrorMessage("注册失败，请重试");
            }
        } else {
            //如果该用户已经激活了
            if (user.getStatus()) {
                return ServerResponse.createByErrorMessage("该邮箱已注册");
            }
            //未激活状态
            if (!user.getPassword().equals(encodedPassword)) {
                //更新密码
                int rows = userMapper.updatePasswordByEmail(email, encodedPassword);
                if (rows < 1) {
                    return ServerResponse.createByErrorMessage("注册失败，请重试");
                }
            }
        }
        //存储token
        String token = UUID.randomUUID().toString();
        stringRedisTemplate.opsForValue().set(token, email, EmailConst.DEFAULT_EMAIL_EXPIRES, TimeUnit.SECONDS);
        //异步发送激活邮件
        Map<String, String> map = new HashMap<>();
        map.put(EmailConst.EMAIL, email);
        map.put(EmailConst.EMAIL_TOKEN, token);
        emailMessageProducer.sendMessage(JacksonUtil.bean2Json(map));
        return ServerResponse.createBySuccess();
    }

    @Override
    public ServerResponse activate(String token) {
        String email = stringRedisTemplate.opsForValue().get(token);
        if (StringUtils.isBlank(email)) {
            return ServerResponse.createByErrorMessage("激活链接已失效");
        }
        User user = userMapper.selectByEmail(email);
        if (user.getStatus()) {
            return ServerResponse.createBySuccessMessage("您已经激活成功了");
        }
        //根据email修改用户的状态
        int rows = userMapper.updateStatusByEmail(email, true);
        if (rows < 1) {
            return ServerResponse.createByErrorMessage("更新用户状态失败");
        }
        return ServerResponse.createBySuccess();
    }

    @Override
    public User findUserByEmail(String email) {
        return userMapper.selectByEmailStatus(email, true);
    }

    @Override
    public ServerResponse me() {
        CurrentUser currentUser = CurrentUser.getCurrentUser();
        User user = userMapper.selectByPrimaryKey(currentUser.getId());
        UserOutputDTO userOutputDTO = new UserOutputDTO();
        userOutputDTO.setId(user.getId())
                .setEmail(user.getEmail())
                .setUsername(user.getUsername())
                .setRole(RoleEnum.fromRoleId(user.getRoleid()))
                .setStatus(UserStatus.fromEnable(user.getStatus()));
        return ServerResponse.createBySuccess(userOutputDTO);
    }

    @Override
    public ServerResponse updateUsername(String username) {
        if(StringUtils.isBlank(username)){
            return ServerResponse.createByErrorMessage("用户名不能为空") ;
        }
        CurrentUser currentUser = CurrentUser.getCurrentUser() ;
        int rows = userMapper.updateUsernameBYPrimaryKey(currentUser.getId(), username);
        if(rows < 1){
            return ServerResponse.createByErrorMessage("修改用户名失败") ;
        }
        return me();
    }

}
