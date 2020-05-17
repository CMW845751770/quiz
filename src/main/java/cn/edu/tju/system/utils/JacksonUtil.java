package cn.edu.tju.system.utils;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.TimeZone;

public class JacksonUtil {

    private static ObjectMapper mapper;

    static {
        if (mapper == null) {
            mapper = new ObjectMapper();
        }
        TimeZone china = TimeZone.getTimeZone("GMT+08:00");
        mapper.setTimeZone(china);
        mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
    }

    public static synchronized String bean2Json(Object object) throws JsonProcessingException {
        return mapper.writeValueAsString(object);
    }

    public static synchronized <T> T json2Bean(String jsonStr, Class<T> objClass) throws IOException {
        return mapper.readValue(jsonStr, objClass);
    }

    public static synchronized <T> T json2BeanT(String jsonStr, TypeReference<T> typeReference) throws IOException {
        return mapper.readValue(jsonStr, typeReference);
    }

    public static synchronized JsonNode json2JsonNode(String jsonStr) throws IOException {
        return mapper.readTree(jsonStr);
    }
}
