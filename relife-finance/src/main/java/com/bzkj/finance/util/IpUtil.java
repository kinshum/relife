package com.bzkj.finance.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.InetAddress;

/**
 * description: 获取本机Ip工具
 * author: wang
 * date: 2017/7/5
 * update: 2017/7/5 15:19
 * version:
 */
public class IpUtil {

    private static final Logger logger = LoggerFactory.getLogger(IpUtil.class);

    public static String getIP(){
        try {
            String ip = InetAddress.getLocalHost().getHostAddress();
            logger.info("获取本机Ip = "+ip);
            return ip;
        }catch (Throwable e){
           logger.error("获取本机ip失败！",e);
        }
        return null;
    }

    public static String getHostName() {
        try {
            String hostName = InetAddress.getLocalHost().getHostName();
            logger.info("获取本机名称 = "+hostName);
            return hostName;
        }catch (Throwable e){
            logger.error("获取本机名称失败！",e);
        }
        return null;
    }
}
