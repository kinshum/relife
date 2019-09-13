package com.bzkj.annotation;

import java.lang.annotation.*;

/**
 * @description 本注解用在Controller层的接口上，表示访问该接口所需的角色
 * @author: jensen
 * @date: created by 2019/9/11 2:36
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Role {
    public String value();
}
