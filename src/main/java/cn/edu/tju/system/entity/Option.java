package cn.edu.tju.system.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.util.Date;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class Option {
    private Integer id;

    private String description;

    private Boolean correct;

    private Integer pid;

    private Date createTime;

    private Date updateTime;
}