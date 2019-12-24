package com.bzkj.config;

import com.alibaba.dubbo.config.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @description: dubbo 配置
 * @author: jensen
 * @date: created by 2019/9/12 12:03
 */
@Configuration
@EnableConfigurationProperties(DubboProperties.class)
public class DubboAutoConfiguration {

    @Autowired
    private DubboProperties dubboProperties;

    @Bean
    public ApplicationConfig requestApplicationConfig() {
        ApplicationConfig applicationConfig = dubboProperties.getApplication();
        if (applicationConfig == null) {
            applicationConfig = new ApplicationConfig();
        }
        applicationConfig.setQosEnable(false);
        return applicationConfig;
    }

    @Bean
    public RegistryConfig requestRegistryConfig() {
        RegistryConfig registryConfig = dubboProperties.getRegistry();
        if (registryConfig == null) {
            registryConfig = new RegistryConfig();
        }
        return registryConfig;
    }

    @Bean
    public ProtocolConfig requestProtocolConfig() {
        ProtocolConfig protocolConfig = dubboProperties.getProtocol();
        if (protocolConfig == null) {
            protocolConfig = new ProtocolConfig();
        }
        protocolConfig.setId("dubbo");
        protocolConfig.setName("dubbo");
        return protocolConfig;
    }

    @Bean
    public MonitorConfig requestMonitorConfig() {
        MonitorConfig monitorConfig = dubboProperties.getMonitor();
        if (monitorConfig == null) {
            monitorConfig = new MonitorConfig();
        }
        return monitorConfig;
    }

    @Bean
    public ProviderConfig requestProviderConfig() {
        ProviderConfig providerConfig = dubboProperties.getProvider();
        if (providerConfig == null) {
            providerConfig = new ProviderConfig();
        }
        return providerConfig;
    }

    @Bean
    public ModuleConfig requestModuleConfig() {
        ModuleConfig moduleConfig = dubboProperties.getModule();
        if (moduleConfig == null) {
            moduleConfig = new ModuleConfig();
            moduleConfig.setDefault(false);
        }
        return moduleConfig;
    }



    @Bean
    public ConsumerConfig requestConsumerConfig() {
        ConsumerConfig consumerConfig = dubboProperties.getConsumer();
        if (consumerConfig == null) {
            consumerConfig = new ConsumerConfig();
            consumerConfig.setCheck(false);
            consumerConfig.setTimeout(40000);
            return consumerConfig;
        }
        return consumerConfig;
    }
}
