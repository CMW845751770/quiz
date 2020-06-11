package cn.edu.tju.back.controller;

import cn.edu.tju.back.dto.input.PageBackInputDTO;
import cn.edu.tju.back.service.OJService;
import cn.edu.tju.system.base.ResponseCode;
import cn.edu.tju.system.base.ServerResponse;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.Calendar;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/14 15:01
 */
@RestController
@RequestMapping("/api/back/oj")
@Validated
public class OJBackController {

    @Resource
    private OJService ojServiceImpl ;

    /**
     * 返回OJ题的排名以及各个难度的通过题数
     * @return
     */
    @GetMapping("/rank/me")
    public ServerResponse myRank(){
        return ojServiceImpl.myRank() ;
    }

    /**
     *需要返回几天前提交的、title、pass
     * @param page
     * @return
     */
    @GetMapping("/progress")
    public ServerResponse progress(@Valid PageBackInputDTO page){
        return ojServiceImpl.progress(page) ;
    }

    @GetMapping("/progress/{rid}")
    public ServerResponse timeRank(@PathVariable("rid")Integer rid){
        return ojServiceImpl.timeRank(rid) ;
    }

    @GetMapping("/progress/submit")
    public ServerResponse submitRecord(Integer year){
        if(year == null || year < 1970 || year > Calendar.getInstance().get(Calendar.YEAR)){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT) ;
        }
        return ojServiceImpl.submitRecord(year) ;
    }
}
