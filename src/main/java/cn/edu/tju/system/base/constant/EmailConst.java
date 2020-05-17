package cn.edu.tju.system.base.constant;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/7 11:45
 */
public class EmailConst {

    public static final int DEFAULT_EMAIL_EXPIRES = 5 * 60;//redis中邮件token的默认存活时间
    public static final String EMAIL = "email"; //RabbitMQ中序列化需要的email的map的key
    public static final String EMAIL_TOKEN = "email_token";//RabbitMQ中序列化需要的token的map的key
    public static final String DEFAULT_EMAIL_THEME = "QUIZ服务";//激活邮件的默认值主题
    public static final String ACTIVATE_URL_PREFIX = "http://localhost/activation.html%s";//邮件中的激活链接

}