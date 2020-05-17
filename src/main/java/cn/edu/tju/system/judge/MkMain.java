package cn.edu.tju.system.judge;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class MkMain {


    public static String mkMainFile(String input,String output,Integer timeout){

        //ListBean listBean = listService.listAll(pid);

        String front ="import org.junit.Test;" +
                "import static org.junit.Assert.assertEquals;" +
                "import static org.junit.Assert.assertTrue;" +
                "import java.io.*;" +
                "public class MainTest {"+
                " Main calculation = new Main();" +
                " @Test(timeout = "+timeout+")" +
                " public void test() {" +
                " String data = \"";

        //String input = listBean.getInput();

        String tummy = "\";" +
                " InputStream stdin = System.in;" +
                " final ByteArrayOutputStream outContent = new ByteArrayOutputStream();" +
                " System.setOut(new PrintStream(outContent));" +
                " try {" +
                " System.setIn(new ByteArrayInputStream(data.getBytes()));" +
                " calculation.main(null);" +
                " } finally {" +
                " System.setIn(stdin);" +
                " }" +
                "String lineSeparator = System.getProperty(\"line.separator\");"+
                " assertEquals(\"";

        //String output = listBean.getOutput();

        String tail ="\", outContent.toString().trim().replaceAll(lineSeparator, \" \"));" +
                " }" +
                "}";
        String all = front+input+tummy+output+tail;
        writeCode(all);
        return "ok";
    }
    public static void writeCode(String code){
        try {
            // temp中新建文件夹
//            executeCmd("mkdir");
            // runBash("mkdir", "run");

//            Runtime.getRuntime().exec("mkdir " + "./run").waitFor();
            BufferedWriter bw = new BufferedWriter(new FileWriter
                    ("code/MainTest.java"));
            // 写入代码
            bw.write(code);
            bw.flush();

        } catch (IOException e) {
            e.printStackTrace();
        } //catch (InterruptedException e) {
        //e.printStackTrace();
        //}
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
