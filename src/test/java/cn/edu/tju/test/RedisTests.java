package cn.edu.tju.test;

import cn.edu.tju.QuizApplicationTests;
import org.junit.Test;
import org.springframework.data.redis.core.RedisTemplate;
import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/9 17:20
 */
public class RedisTests extends QuizApplicationTests {

    @Resource
    private RedisTemplate<String,String> redisTemplate ;

    @Test
    public void testRedisConfig(){
        redisTemplate.opsForValue().set("hello","world",1, TimeUnit.SECONDS);
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}
