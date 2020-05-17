package cn.edu.tju.system.controller;

import cn.edu.tju.system.annotations.AccessLimit;
import cn.edu.tju.system.base.ServerResponse;
import cn.edu.tju.system.dto.input.OJProblemInputDTO;
import cn.edu.tju.system.dto.input.PageInputDTO;
import cn.edu.tju.system.service.OJProblemService;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 18:17
 */
@RestController
@Validated
@RequestMapping("/api/oj")
public class OJProblemController {

    @Resource
    private OJProblemService ojProblemServiceImpl ;

    @GetMapping("list")
    public ServerResponse problemList(@Valid PageInputDTO page){
        return ojProblemServiceImpl.problemList(page) ;
    }

    @GetMapping("{id}")
    public ServerResponse showProblem(@PathVariable("id")Integer id){
        return ojProblemServiceImpl.showProblem(id) ;
    }

    @PostMapping("submit")
    @AccessLimit(seconds = 10)
    public ServerResponse problemSubmit(@RequestBody @Valid OJProblemInputDTO ojProblem){
        return ojProblemServiceImpl.submit(ojProblem) ;
    }

    @GetMapping("rank")
    public ServerResponse rank(@Valid PageInputDTO page){
        return ojProblemServiceImpl.rank(page) ;
    }
}
