package cn.edu.tju.system.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * @Author: CMW天下第一
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Accessors(chain = true)
public class EmailModel implements Serializable {

    /**
     * 收件人姓名
     **/
    private String recieverName;

    /**
     * 收件人邮箱地址
     **/
    private String recieverEmailAddress;

    /**
     * 邮件主题
     **/
    private String emailTheme;

    /**
     * 邮件内容
     **/
    private String emailContent;
}
