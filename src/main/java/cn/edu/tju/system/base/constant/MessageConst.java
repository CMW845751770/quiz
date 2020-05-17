package cn.edu.tju.system.base.constant;

/**
 * @Author: CMW天下第一
 */
public class MessageConst {

    public static final String EMAIL_ACTIVATE_AMQP_ROUTINGKEY = "email.activate" ;//用户使用邮箱功能注册的时候的rabbitmq的路由key
    public static final String EMAIL_ACTIVATE_AMQP_EXCHANGE = "email_activate_exchange" ;//用户使用邮箱功能注册的时候的rabbitmq的exchange
    public static final String EMAIL_ACTIVATE_AMQP_QUEUE= "email_activate_queue" ;//用户使用邮箱功能注册的时候的rabbitmq的queue
    public static final String EMAIL_ACTIVATE_AMQP_QUEUE_ROUTINGKEY= "email.#" ;//用户使用邮箱功能注册的时候的rabbitmq的queue

}
