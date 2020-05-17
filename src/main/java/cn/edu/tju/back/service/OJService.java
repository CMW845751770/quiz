package cn.edu.tju.back.service;

import cn.edu.tju.back.dto.input.PageBackInputDTO;
import cn.edu.tju.system.base.ServerResponse;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/14 15:02
 */
public interface OJService {

    ServerResponse myRank() ;

    ServerResponse progress(PageBackInputDTO page) ;
}
