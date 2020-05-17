package cn.edu.tju.system.utils;

import cn.edu.tju.system.base.constant.EmailConst;

/**
 * @Author: CMW天下第一
 */
public class EmailUtils {

    public static String registerHTMLTemplate(String receiverName,String activateUrl){
        return String.format(DEFAULT_REGISTER_TEMPLATE,receiverName,receiverName,activateUrl,activateUrl,activateUrl) ;
    }

    private static final String SERVICE = "quiz服务" ;
    private static final String DEFAULT_REGISTER_TEMPLATE="\t\t<table>\n" +
            "              <tbody><tr height=\"40\">\n" +
            "                <td style=\"padding-left:25px;padding-right:25px;font-size:18px;font-family:'微软雅黑','黑体',arial;\">\n" +
            "                  尊敬的<a href=\"mailto:%s\" rel=\"noopener\" target=\"_blank\">%s</a>，您好,\n" +
            "                </td>\n" +
            "              </tr>\n" +
            "              <tr height=\"15\">\n" +
            "                <td></td>\n" +
            "              </tr>\n" +
            "              <tr height=\"30\">\n" +
            "                <td style=\"padding-left:55px;padding-right:55px;font-family:'微软雅黑','黑体',arial;font-size:14px;\">\n" +
            "                  感谢您使用"+SERVICE+"。\n" +
            "                </td>\n" +
            "              </tr>\n" +
            "              <tr height=\"30\">\n" +
            "                <td style=\"padding-left:55px;padding-right:55px;font-family:'微软雅黑','黑体',arial;font-size:14px;\">\n" +
            "                  请点击以下链接进行邮箱验证，以便开始使用您的"+SERVICE+"账户：\n" +
            "                </td>\n" +
            "              </tr>\n" +
            "              <tr height=\"60\">\n" +
            "                <td style=\"padding-left:55px;padding-right:55px;font-family:'微软雅黑','黑体',arial;font-size:14px;\">\n" +
            "                  <a href=\"%s\" target=\"_blank\" style=\"display: inline-block;color:#fff;line-height: 40px;background-color: #1989fa;border-radius: 5px;text-align: center;text-decoration: none;font-size: 14px;padding: 1px 30px;\" rel=\"noopener\">\n" +
            "                    马上验证邮箱\n" +
            "                  </a>\n" +
            "                </td>\n" +
            "              </tr>\n" +
            "              <tr height=\"10\">\n" +
            "                <td></td>\n" +
            "              </tr>\n" +
            "              <tr height=\"20\">\n" +
            "                <td style=\"padding-left:55px;padding-right:55px;font-family:'微软雅黑','黑体',arial;font-size:12px;\">\n" +
            "                  如果您无法点击以上链接，请复制以下网址到浏览器里直接打开：\n" +
            "                </td>\n" +
            "              </tr>\n" +
            "              <tr height=\"30\">\n" +
            "                <td style=\"padding-left:55px;padding-right:65px;font-family:'微软雅黑','黑体',arial;line-height:18px;\">\n" +
            "                  <a style=\"color:#0c94de;font-size:12px;\" href=\"%s\" rel=\"noopener\" target=\"_blank\">\n" +
            "                    %s\n" +
            "                  </a>\n" +
            "                </td>\n" +
            "              </tr>\n" +
            "              <tr height=\"20\">\n" +
            "                <td style=\"padding-left:55px;padding-right:55px;font-family:'微软雅黑','黑体',arial;font-size:12px;\">\n" +
            "                  如果您并未申请"+SERVICE+"账户，可能是其他用户误输入了您的邮箱地址，请忽略此邮件。\n" +
            "                </td>\n" +
            "              </tr>\n" +
            "              <tr height=\"20\">\n" +
            "                <td></td>\n" +
            "              </tr>\n" +
            "            </tbody></table>\n" ;

    public static void main(String[] args) {
        String activateUrl = String.format(EmailConst.ACTIVATE_URL_PREFIX,"?token=abcd") ;
        System.out.println(registerHTMLTemplate("2392900639@qq.com",activateUrl));
    }

}
