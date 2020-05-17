package cn.edu.tju.system.message;

import cn.edu.tju.system.utils.EmailUtils;
import cn.edu.tju.system.utils.JacksonUtil;
import cn.edu.tju.system.base.constant.EmailConst;
import cn.edu.tju.system.base.constant.MessageConst;
import cn.edu.tju.system.entity.EmailModel;
import cn.edu.tju.system.service.EmailService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.rabbitmq.client.Channel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.annotation.*;
import org.springframework.amqp.support.AmqpHeaders;
import org.springframework.messaging.Message;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import java.util.Map;

/**
 * @Author: CMW天下第一
 */
@Component
@Slf4j
public class EmailMessageConsumer {

    @Resource
    private EmailService emailServiceImpl ;

    @RabbitListener(bindings = @QueueBinding(value = @Queue(value = MessageConst.EMAIL_ACTIVATE_AMQP_QUEUE,durable = "true")
                    ,exchange = @Exchange(value = MessageConst.EMAIL_ACTIVATE_AMQP_EXCHANGE,type = "topic")
                    ,key = MessageConst.EMAIL_ACTIVATE_AMQP_QUEUE_ROUTINGKEY))
    @RabbitHandler
    public void process(Message msg , Channel channel){
        boolean isSuccess = true ;
        try {
            String message = (String) msg.getPayload();
            log.info("SendEmailMessageReceiver的process方法中从【{}】接收到消息：【{}】", MessageConst.EMAIL_ACTIVATE_AMQP_ROUTINGKEY,message);
            Map<String,String> map = JacksonUtil.json2BeanT(message, new TypeReference<Map<String, String>>() {}) ;
            String emailToken = map.get(EmailConst.EMAIL_TOKEN) ;
            String email= map.get(EmailConst.EMAIL) ;
            EmailModel emailModel = new EmailModel() ;
            emailModel.setEmailTheme(EmailConst.DEFAULT_EMAIL_THEME);
            emailModel.setRecieverName(email);
            emailModel.setRecieverEmailAddress(email);
            String activateUrl = String.format(EmailConst.ACTIVATE_URL_PREFIX,"?token="+ emailToken) ;
            emailModel.setEmailContent(EmailUtils.registerHTMLTemplate(email,activateUrl));
            emailServiceImpl.sendEmail(emailModel);
        }catch (Exception e){
            log.error("消费端发送邮件发生异常 {}",e.getMessage());
            isSuccess = false ;
        }
        Long deliveryTag  = (Long) msg.getHeaders().get(AmqpHeaders.DELIVERY_TAG);
        try {
            if(!isSuccess){
                boolean isRedelivered = (boolean) msg.getHeaders().get(AmqpHeaders.REDELIVERED);
                if(isRedelivered){
                    //已经投递过了 记录日志
                    channel.basicNack(deliveryTag,false,false);
                    log.error("消费端发送邮件处理异常，请人工补偿，消息 {}",msg.getPayload());
                }else{
                    log.info("消费端发送邮件处理异常,重新入队,消息 {}",msg.getPayload());
                    channel.basicNack(deliveryTag,false,true);
                }
            }else{
                //业务处理成功则ack
                log.info("消费端发送邮件成功",msg.getPayload());
                channel.basicAck(deliveryTag,false);
            }
        }catch (Exception e){
            log.error("消费端ACK时发生异常 {}",e.getMessage());
        }

    }
}
