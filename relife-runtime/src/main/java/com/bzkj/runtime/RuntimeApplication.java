package com.bzkj.runtime;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

/**
 * @description: Runtime启动类
 * @author: jensen
 * @date: created by 2019/9/11 1:36
 */
@SpringBootApplication
public class RunTimeApplication extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(RunTimeApplication.class, args);
    }

    @Override//为了打包springboot项目
    protected SpringApplicationBuilder configure(
            SpringApplicationBuilder builder) {
        return builder.sources(this.getClass());
    }

}
