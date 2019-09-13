package com.bzkj.utils;



import org.apache.commons.net.util.Base64;

/**
 * @author admin
 */
public class PasswordUtil {
    /**
     * 该数据为种子数，如果要加密则需要使用Base64做多次迭代
     */
    private static final String SEED = "mldnjava";
    /**
     * 密码迭代处理3次
     */
    private static final int NE_NUM = 3;

    /**
     * 创建一个基于Base64的种子数
     */
    private static String createSeed() {
        String str = SEED;
        for (int x = 0; x < NE_NUM; x++) {
            str = Base64.encodeBase64String(str.getBytes());
        }
        return str;
    }

    /**
     * 进行密码的处理操作
     *
     * @param password 用户输入的真实密码
     * @return 与数据库保存匹配的加密的处理密码
     */
    public static String getPassword(String password) {
        Md5Code md5 = new Md5Code();
        String pass = "{" + password + ":" + createSeed() + "}";
        for (int x = 0; x < NE_NUM; x++) {
            pass = md5.getMD5ofStr(pass);
        }
        return pass;
    }

    public static void main(String[] args) {
        System.out.println(getPassword("wda1992"));
    }

}
