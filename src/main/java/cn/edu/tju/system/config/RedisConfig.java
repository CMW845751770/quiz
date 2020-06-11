package cn.edu.tju.system.config;

import cn.edu.tju.system.entity.ProblemDO;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/9 17:17
 */
@Configuration
public class RedisConfig {

    @Bean("redisTemplate")
    public RedisTemplate redisTemplate(RedisConnectionFactory redisConnectionFactory){
        RedisTemplate<String,Object> redisTemplate = new RedisTemplate<>() ;
        redisTemplate.setConnectionFactory(redisConnectionFactory);
        RedisSerializer stringSerializer = new StringRedisSerializer();
        redisTemplate.setKeySerializer(stringSerializer);
        return redisTemplate ;
    }

    @Bean("problemRedisTemplate")
    public RedisTemplate problemRedisTemplate(RedisConnectionFactory factory) {
        RedisTemplate<String,ProblemDO> redisTemplate = new RedisTemplate<>();
        RedisSerializer stringSerializer = new StringRedisSerializer();
        ObjectMapper om = new ObjectMapper();
        Jackson2JsonRedisSerializer<ProblemDO> jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer<>(ProblemDO.class) ;
        jackson2JsonRedisSerializer.setObjectMapper(om);
        redisTemplate.setConnectionFactory(factory);
        redisTemplate.setKeySerializer(stringSerializer);
        redisTemplate.setValueSerializer(jackson2JsonRedisSerializer);
        return redisTemplate;
    }

    @Bean
    RedisMessageListenerContainer container(RedisConnectionFactory connectionFactory) {

        RedisMessageListenerContainer container = new RedisMessageListenerContainer();
        container.setConnectionFactory(connectionFactory);
        return container;
    }
}
