package com.bzkj.utils;import java.util.UUID;/** * @description: * @author: jensen * @date: created by 2019/9/13 5:22 */public class KeyGenerator {    /**     * 获得一个UUID     * @return String UUID     */    public static String getKey(){        String uuid = UUID.randomUUID().toString();        //去掉“-”符号        return uuid.replaceAll("-", "");    }}