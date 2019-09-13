package com.bzkj.annotation;

import java.lang.annotation.*;

/**
 * @description: 本注解用在Controller层的接口方法上，用于表示访问该接口所需的权限
 * @author: jensen
 * @date: created by 2019/9/11 2:59
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Permission {
    public String value();
}
