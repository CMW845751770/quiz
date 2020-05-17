package cn.edu.tju.back.dto.input;

import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 19:26
 */
@Data
public class PageBackInputDTO {


    @Min(value = 1,message = "至少从第一页开始")
    private int pageNum = 1;

    @Min(value = 1,message = "至少一页要有一个")
    @Max(value = 20,message = "最多一页十六个")
    private int pageSize = 15;
}
