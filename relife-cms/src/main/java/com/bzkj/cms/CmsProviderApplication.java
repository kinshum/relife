package com.bzkj.cms;import org.mybatis.spring.annotation.MapperScan;import org.springframework.boot.SpringApplication;import org.springframework.boot.autoconfigure.SpringBootApplication;import org.springframework.boot.builder.SpringApplicationBuilder;import org.springframework.boot.web.support.SpringBootServletInitializer;import org.springframework.context.annotation.Bean;import org.springframework.context.annotation.ComponentScan;import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;/** * @description: * @author: jensen * @date: created by 2019/9/11 2:38 */@SpringBootApplication@MapperScan(basePackages = {"com.bzkj.cms.dao"})@ComponentScan(basePackages = {"com.bzkj.cms.service"})public class CmsProviderApplication extends SpringBootServletInitializer {    @Bean    public BCryptPasswordEncoder bCryptPasswordEncoder() { //这里注入了就可以了        return new BCryptPasswordEncoder();    }        public static void main(String[] args) {        SpringApplication springApplication = new SpringApplication(CmsProviderApplication.class);        springApplication.run(args);    }    @Override//为了打包springboot项目    protected SpringApplicationBuilder configure(            SpringApplicationBuilder builder) {        return builder.sources(this.getClass());    }}