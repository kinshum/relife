package com.bzkj.auth.swagger.apidoc;import org.springframework.context.annotation.Bean;import org.springframework.context.annotation.Configuration;import org.springframework.context.annotation.Profile;import springfox.documentation.spring.web.plugins.Docket;import springfox.documentation.swagger2.annotations.EnableSwagger2;/** * @description: * @author: jensen * @date: created by 2019/9/11 11:17 */@Configuration@EnableSwagger2//dev,test可用,prod环境禁用@Profile({"dev","test"})public class ApiDocs {    @Bean    public Docket Domp() {        return DompApis.docs();    }}