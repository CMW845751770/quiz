package cn.edu.tju.back.service.impl;

import cn.edu.tju.back.service.UserBackService;
import cn.edu.tju.system.mapper.UserMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/14 19:07
 */
@Service
@Slf4j
public class UserBackServiceImpl implements UserBackService {

    @Resource
    private UserMapper userMapper ;

    @Override
    public int getTotalUserCount() {
        return userMapper.selectTotalCount();
    }
}
