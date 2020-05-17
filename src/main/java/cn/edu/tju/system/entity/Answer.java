package cn.edu.tju.system.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Accessors(chain = true)
public class Answer {
    private Integer id;

    private Integer pid;

    private Boolean correct;

    private Integer uid;

    private Integer rid;

    private Date createTime;

    private Date updateTime;
}