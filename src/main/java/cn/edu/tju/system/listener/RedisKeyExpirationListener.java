package cn.edu.tju.system.listener;

import cn.edu.tju.system.base.constant.QuizConst;
import cn.edu.tju.system.entity.ProblemDO;
import cn.edu.tju.system.service.QuizService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.listener.KeyExpirationEventMessageListener;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/14 11:46
 */
/*@Component
@Slf4j
public class RedisKeyExpirationListener extends KeyExpirationEventMessageListener {

    *//**
     *
     * @param listenerContainer
     *//*
    public RedisKeyExpirationListener(RedisMessageListenerContainer listenerContainer) {
        super(listenerContainer);
    }


    @Resource
    private RedisTemplate<String, ProblemDO> problemRedisTemplate;

    @Override
    public void onMessage(Message message, byte[] pattern) {
        // 用户做自己的业务处理即可,注意message.toString()可以获取失效的key
        String expiredKey = message.toString();
        log.info("key 【{}】过期",expiredKey);
        if (expiredKey.startsWith(QuizConst.QUIZ_PROBLEM_LIST_PREFIX_KEY_EXPIRED)) {
            Integer id = Integer.valueOf(expiredKey.replace(QuizConst.
                    QUIZ_PROBLEM_LIST_PREFIX_KEY_EXPIRED,"")) ;
            problemRedisTemplate.delete(String.format(QuizConst.QUIZ_RECORD_PREFIX
                    , id));
        }
    }
}*/
