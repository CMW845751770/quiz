package cn.edu.tju.back.service;

import cn.edu.tju.system.base.ServerResponse;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/14 18:30
 */
public interface QuizBackService {

    ServerResponse myRank() ;

    ServerResponse progress() ;
}
