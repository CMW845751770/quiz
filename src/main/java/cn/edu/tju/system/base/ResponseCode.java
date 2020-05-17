package cn.edu.tju.system.base;

/**
 * 响应状态码的枚举类
 */
public enum ResponseCode {

    SUCCESS(10000,"SUCCESS"),
    ERROR(10001,"ERROR"),
    ILLEGAL_ARGUMENT(10002,"ILLEGAL_ARGUMENT"),
    RATE_LIMIT(10003,"YOUR OPERATION IS TOO FREQUENT"),
    NEED_LOGIN(10004,"NEED_LOGIN"),
    ACCESS_DENIED(10005,"ACCESS_DENIED");

    private final int code;
    private final String desc;


    ResponseCode(int code,String desc){
        this.code = code;
        this.desc = desc;
    }

    public int getCode(){
        return code;
    }
    public String getDesc(){
        return desc;
    }

}
