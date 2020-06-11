package cn.edu.tju.test;

import cn.edu.tju.QuizApplicationTests;
import cn.edu.tju.system.entity.Answer;
import cn.edu.tju.system.mapper.AnswerMapper;
import cn.edu.tju.system.utils.JacksonUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.common.collect.Lists;
import org.junit.Test;

import javax.annotation.Resource;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/30 12:23
 */
public class AnswerMapperTests extends QuizApplicationTests {

    @Resource
    private AnswerMapper answerMapper ;

    @Test
    public void test() throws JsonProcessingException {
    }
}
