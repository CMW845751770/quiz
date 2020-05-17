package cn.edu.tju.back.controller;

import cn.edu.tju.back.service.QuizBackService;
import cn.edu.tju.system.base.ServerResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/14 18:23
 */
@RestController
@RequestMapping("/api/back/quiz")
public class QuizBackController {

    @Resource
    private QuizBackService quizBackServiceImpl ;

    /**
     * 返回选择题的排名以及最近5次的得分
     * @return
     */
    @GetMapping("/rank/me")
    public ServerResponse myRank(){
        return quizBackServiceImpl.myRank() ;
    }

    /**
     * 查询出回答的总题数、正确率以及考试的平均分
     * @return
     */
    @GetMapping("/progress")
    public ServerResponse progress(){
        return quizBackServiceImpl.progress() ;
    }
}
