package cn.edu.tju.back.service;

import cn.edu.tju.back.dto.input.PageBackInputDTO;
import cn.edu.tju.system.base.ServerResponse;

import java.io.IOException;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/14 18:30
 */
public interface QuizBackService {

    ServerResponse myRank() ;

    ServerResponse progress() ;

    ServerResponse errorRank(PageBackInputDTO page) ;

    ServerResponse errorRankProblem(Integer pid) throws IOException;
}
