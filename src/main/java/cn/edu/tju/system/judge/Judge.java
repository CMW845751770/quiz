package cn.edu.tju.system.judge;


import cn.edu.tju.security.entity.CurrentUser;
import cn.edu.tju.system.dto.input.OJProblemSubmitDTO;
import cn.edu.tju.system.entity.OJRecord;
import cn.edu.tju.system.entity.TestExample;
import cn.edu.tju.system.enums.OJErrorEnum;
import lombok.extern.slf4j.Slf4j;

import java.io.*;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

@Slf4j
public class Judge {

    public static final String lineSeparator = System.getProperty("line.separator");
    public static final String BLANK_SPACE = " ";
    // 删除历史残留文件
    private static String cmdDele = "rm -rf Main.class MainTest.class Main.java MainTest.java";

    private static String cmdCompileMMT = "javac -cp .:./hamcrest-all-1.3.jar:./junit-4.13-beta-2.jar Main.java MainTest.java";
    // run MainTest
    private static String cmdRunMT = "java -cp .:./junit-4.13-beta-2.jar:./hamcrest-all-1.3.jar org.junit.runner.JUnitCore MainTest";

    private static final int DEFAULT_RUN_BASH_TIMEOUT = 5;//默认命令5秒超时

    private static final String ACTUAL_OUTPUT_JUDGE_INDEX_STR = "but was:";

    // 把网页代码写入的Main.java
    public static void Writecode(String code) {
        try {
            BufferedWriter bw = new BufferedWriter(new FileWriter
                    ("code/Main.java"));
            // 写入代码
            bw.write(code);
            bw.flush();

        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 判题系统
    public static OJRecord judge(OJProblemSubmitDTO ojProblem) {
        try {
            String code = ojProblem.getCode();
            runBash(cmdDele, "code");
            Writecode(code);
            //多个测试用例迭代测试
            List<TestExample> testExampleList = ojProblem.getTestExampleList();
            String result = "";
            for (TestExample testExample : testExampleList) {
                MkMain.mkMainFile(testExample.getInput(), testExample.getOutput(),
                        ojProblem.getTimeout() * 1000);
                String cmd = cmdCompileMMT + "&&" + cmdRunMT;
                result = runBash(cmd, "code");
                if (!result.contains("OK")) {
                    return buildOJRecord(result, ojProblem.getPid(), testExample);
                }
            }
            return buildOJRecord(result, ojProblem.getPid(), null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return buildOJRecord("", ojProblem.getPid(), null);
    }

    private static OJRecord buildOJRecord(String result, Integer pid, TestExample testExample) {
        Integer uid = CurrentUser.getCurrentUser().getId();
        OJRecord ojRecord = new OJRecord();
        ojRecord.setUid(uid);
        ojRecord.setPid(pid);
        if (result.isEmpty()) {
            ojRecord.setTime(new BigDecimal("-1"))
                    .setInfo(OJErrorEnum.COMPILATION_ERROR.getError())
                    .setPass(false);
            return ojRecord;
        }
        result = result.replaceAll(lineSeparator, "");
        //判断是否通过
        boolean pass = result.contains("OK");
        ojRecord.setPass(pass);
        if (pass) {
            int timeIndex = result.indexOf("Time");
            BigDecimal time = new BigDecimal(result.substring(timeIndex + 6, timeIndex + 11));
            ojRecord.setTime(time)
                    .setInfo("OK");
            return ojRecord;
        }
        int timeIndex = result.indexOf("Time");
        if (timeIndex == -1) {
            ojRecord.setInfo(OJErrorEnum.COMPILATION_ERROR.getError());
        } else {
            String wrongAnswerInfo = "输入：%s\r\n" +
                    "预期结果：%s\r\n" +
                    "实际输出：%s";
            //<[fals]e> 难顶
            String info = result.substring(timeIndex + 11, result.indexOf("FAILURES"));
            String actualOutput = info;
            if (info.contains(ACTUAL_OUTPUT_JUDGE_INDEX_STR)) {
                info = info.substring(info.indexOf(ACTUAL_OUTPUT_JUDGE_INDEX_STR));
                int indexOutput = info.indexOf("<");
                int indexOutput2 = info.indexOf(">");
                actualOutput = info.substring(indexOutput, indexOutput2 + 1).replace("<", "")
                        .replace(">", "").replace("[", "")
                        .replace("]", "").trim();

            }
            ojRecord.setInfo(String.format(wrongAnswerInfo, testExample.getInput(), testExample.getOutput(),
                    actualOutput));
        }
        ojRecord.setTime(new BigDecimal("-1"));
        return ojRecord;
    }

    // 运行后返回的信息
    public static String cmdResInfo(InputStream inputStream) {
        StringBuilder info = new StringBuilder();
        BufferedReader bw = null;
        try {
            bw = new BufferedReader(new InputStreamReader(inputStream));
            String res;
            while ((res = bw.readLine()) != null) {
                info.append(res);
                info.append("\n");
            }
            return info.toString();

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "";
    }


    // 获取进程ID
    public static int getUnixPID(Process process) throws Exception {
        System.out.println(process.getClass().getName());
        if (process.getClass().getName().equals("java.lang.UNIXProcess")) {
            Class cl = process.getClass();
            Field field = cl.getDeclaredField("pid");
            field.setAccessible(true);
            Object pidObject = field.get(process);
            return (Integer) pidObject;
        } else {
            throw new IllegalArgumentException("Needs to be a UNIXProcess");
        }
    }

    // 杀死进程
    public static int killUnixProcess(Process process) throws Exception {
        int pid = getUnixPID(process);
        return Runtime.getRuntime().exec("pkill -TERM -P " + pid).waitFor();
    }

    // 创建临时文件
    public static File createTempScript(String cmd) throws IOException {
        File tempScript = File.createTempFile("tempScript.sh", null);
        Writer streamWriter = new OutputStreamWriter(new
                FileOutputStream(tempScript));
        PrintWriter printWriter = new PrintWriter(streamWriter);
        printWriter.println("#!/bin/bash");
        printWriter.println(cmd);
        printWriter.close();
        return tempScript;
    }

    // 运行命令
    public static String runBash(String cmd, String dir) throws Exception {
        File tempScript = createTempScript(cmd); // 创建临时⽂件
        // 新建PB对象
        ProcessBuilder pb = new ProcessBuilder("/bin/bash",
                tempScript.toString());
        pb.directory(new File(dir)); // 定义PB运⾏⽬录
        Process process = pb.start();
        String result = "";
        // if为true是才读取返回信息
        if (process.waitFor(DEFAULT_RUN_BASH_TIMEOUT, TimeUnit.SECONDS)) { // 进程执⾏
            // 返回运行结果
            result = cmdResInfo(process.getInputStream());

        } else { // 程序超时
            process.destroyForcibly(); // kill掉该进程的⼦进程
            killUnixProcess(process); // kill盖进程
        }
        return result;
    }

    // 运行cmd命令
    public static List<String> executeCmd(String cmd) {
        Runtime run = Runtime.getRuntime();
        try {
            Process process = run.exec(new String[]{"/bin/sh", "-c", cmd});
            InputStream in = process.getInputStream();
            BufferedReader bs = new BufferedReader(new InputStreamReader(in));
            List<String> list = new ArrayList<String>();
            String result = null;
            while ((result = bs.readLine()) != null) {
                list.add(result);
            }
            in.close();
            process.destroy();
            return list;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
