package cn.edu.tju.system.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.math.BigDecimal;
import java.util.Date;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain = true)
public class OJRecord {
    private Integer id;

    private Integer uid;

    private Integer pid;

    private Boolean pass;

    private BigDecimal time;

    private Date createTime;

    private Date updateTime;

    private String info;
}