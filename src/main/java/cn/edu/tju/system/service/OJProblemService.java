package cn.edu.tju.system.service;

import cn.edu.tju.system.base.ServerResponse;
import cn.edu.tju.system.dto.input.OJProblemInputDTO;
import cn.edu.tju.system.dto.input.PageInputDTO;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 18:19
 */
public interface OJProblemService {

    ServerResponse problemList(PageInputDTO page) ;

    ServerResponse showProblem(Integer id) ;

    ServerResponse submit(OJProblemInputDTO ojProblem) ;

    ServerResponse rank(PageInputDTO page) ;
}
