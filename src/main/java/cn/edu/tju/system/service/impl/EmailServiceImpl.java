package cn.edu.tju.system.service.impl;

import cn.edu.tju.system.entity.EmailModel;
import cn.edu.tju.system.service.EmailService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * @Author: CMW天下第一
 */
@Service
@Slf4j
public class EmailServiceImpl implements EmailService {

    @Resource
    private JavaMailSender javaMailSender ;
    @Value("${spring.mail.username}")
    private String FROM ;

    @Override
    public void sendEmail(EmailModel emailModel) {
        MimeMessage mimeMailMessage = null;
        try {
            mimeMailMessage = javaMailSender.createMimeMessage();
            MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMailMessage, true);
            mimeMessageHelper.setFrom(FROM);
            mimeMessageHelper.setTo(emailModel.getRecieverEmailAddress());
            mimeMessageHelper.setSubject(emailModel.getEmailTheme());
            mimeMessageHelper.setText(emailModel.getEmailContent(), true);
            this.javaMailSender.send(mimeMailMessage);
            log.info("【邮箱已发送至邮箱】:{}", emailModel.getRecieverName());
        } catch (MailException e) {
            log.error("【发送邮件异常】:{}", e.getMessage());
        } catch (MessagingException e) {
            log.error("【邮箱异常】:{}", e.getMessage());
        }
    }
}
