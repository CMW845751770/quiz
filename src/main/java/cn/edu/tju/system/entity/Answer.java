package cn.edu.tju.system.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.util.Date;

@Data
@NoArgsConstructor
@ToString
@Accessors(chain = true)
public class Answer {
    private Integer id;

    private Integer pid;

    private Boolean correct;

    private Integer uid;

    private Integer rid;

    private String optionId ;

    private Date createTime;

    private Date updateTime;

    public Answer(Integer id, Integer pid, Boolean correct, Integer uid, Integer rid, Date createTime, Date updateTime) {
        this.id = id;
        this.pid = pid;
        this.correct = correct;
        this.uid = uid;
        this.rid = rid;
        this.createTime = createTime;
        this.updateTime = updateTime;
    }
}