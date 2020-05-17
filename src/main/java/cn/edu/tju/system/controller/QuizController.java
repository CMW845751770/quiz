package cn.edu.tju.system.controller;

import cn.edu.tju.system.annotations.AccessLimit;
import cn.edu.tju.system.base.ServerResponse;
import cn.edu.tju.system.dto.input.PageInputDTO;
import cn.edu.tju.system.dto.output.RankListDTO;
import cn.edu.tju.system.service.QuizService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/9 16:35
 * 闯关答题的控制器
 */
@RestController
@RequestMapping("/api/quiz")
@Validated
public class QuizController {

    @Resource
    private QuizService quizServiceImpl ;

    @AccessLimit(seconds = 2)
    @PostMapping("start")
    public ServerResponse startQuiz(){
        return quizServiceImpl.startQuiz() ;
    }

    @GetMapping("list")
    public ServerResponse list(){
        return quizServiceImpl.list() ;
    }

    @PostMapping("validate")
    public ServerResponse validate(@RequestParam("pid") Integer pid ,@RequestParam("optionId") List<Integer> optionIds){
        return quizServiceImpl.validate(pid,optionIds) ;
    }

    @PostMapping("result")
    public ServerResponse getResult(){
        return quizServiceImpl.getResult() ;
    }

    @GetMapping("rank")
    public ServerResponse rank(@Valid PageInputDTO page){
        return quizServiceImpl.rank(page) ;
    }
}
