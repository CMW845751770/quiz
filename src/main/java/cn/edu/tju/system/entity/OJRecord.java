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

    public OJRecord(Integer id, Integer uid, Integer pid, Boolean pass, BigDecimal time, Date createTime, Date updateTime, String info) {
        this.id = id;
        this.uid = uid;
        this.pid = pid;
        this.pass = pass;
        this.time = time;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.info = info;
    }

    private Integer passTestExample ;

    private Integer totalTestExample ;
}