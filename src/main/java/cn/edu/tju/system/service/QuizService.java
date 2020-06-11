package cn.edu.tju.system.service;

import cn.edu.tju.system.base.ServerResponse;
import cn.edu.tju.system.dto.input.PageInputDTO;
import com.fasterxml.jackson.core.JsonProcessingException;

import java.util.List;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/9 16:38
 */
public interface QuizService {

    ServerResponse startQuiz() ;

    ServerResponse list() ;

    ServerResponse validate(Integer pid , List<Integer> optionId) throws JsonProcessingException;

    ServerResponse getResult() ;

    ServerResponse rank(PageInputDTO page) ;
}
