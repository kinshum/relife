package com.bzkj.annotation;

import java.lang.annotation.*;


/**
 * @description: 本注解用在Controller层的接口上，表示该接口是否需要登录
 * @author: jensen
 * @date: created by 2019/9/11 0:59
 */
// 本注解只能用在方法上
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Login {

    // 是否需要登录（默认为true）
    public boolean value() default true;

}
