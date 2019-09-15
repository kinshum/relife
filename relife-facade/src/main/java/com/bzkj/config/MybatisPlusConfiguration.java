package com.bzkj.config;

import com.baomidou.mybatisplus.plugins.PaginationInterceptor;
import com.baomidou.mybatisplus.plugins.PerformanceInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @description: mybatisplus配置
 * @author: jensen
 * @date: created by 2019/9/14 13:03
 */
@Configuration
public class MybatisPlusConfiguration {

    /**
     * SQL执行效率插件【生产环境可以关闭】
     *
     * @return PerformanceInterceptor
     * @author yinjj
     * @date 2017/11/19 11:59
     */
    @Bean
    public PerformanceInterceptor performanceInterceptor() {
        return new PerformanceInterceptor();
    }

    /**
     * 分页插件
     *
     * @return PaginationInterceptor
     * @author yinjj
     * @date 2017/11/19 11:59
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        PaginationInterceptor paginationInterceptor = new PaginationInterceptor();
        // 开启 PageHelper 的支持
        paginationInterceptor.setLocalPage(true);
        return paginationInterceptor;
    }
}
