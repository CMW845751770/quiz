package cn.edu.tju.system.base.constant;

/**
 * @Author: CMW天下第一
 * @Date: 2020/5/9 17:27
 */
public class QuizConst {

    //设置在Redis中的rid的前缀
    public static final String QUIZ_RECORD_PREFIX ="quiz_record_%d" ;
    //设置在Redis中的ProblemList的key的前缀
    public static final String QUIZ_PROBLEM_LIST_PREFIX = "quiz_problem_list_%d" ;

    public static final String QUIZ_PROBLEM_LIST_PREFIX_KEY_EXPIRED = "quiz_problem_list_" ;
    //一次请求返回几道题目
    public static final int RESPONSE_PROBLEM_COUNT = 1 ;
    //题目的过期时间
    public static final int PROBLEM_EXPIRES_SECONDS = 60+2 ;
}
