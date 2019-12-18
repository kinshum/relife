package com.bzkj.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * Created by EalenXie on 2018/6/4 14:09
 * 这里个人示例,可自定义相关属性
 */

@TableName("job_entity")
public class JobEntity implements Serializable {

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * job名称
     */
    private String name;
    /**
     * job组名
     */
    private String jobGroup;
    /**
     * 执行的cron
     */
    private String cron;
    /**
     * job的参数
     */
    private String parameter;
    /**
     * job描述信息
     */
    private String description;
    /**
     * vm参数
     */
    private String vmParam;
    /**
     * job的jar路径
     */
    private String jarPath;
    /**
     * job的执行状态,这里我设置为OPEN/CLOSE且只有该值为OPEN才会执行该Job
     */
    private String status;


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getJobGroup() {
        return jobGroup;
    }

    public void setJobGroup(String jobGroup) {
        this.jobGroup = jobGroup;
    }

    public String getCron() {
        return cron;
    }

    public void setCron(String cron) {
        this.cron = cron;
    }

    public String getParameter() {
        return parameter;
    }

    public void setParameter(String parameter) {
        this.parameter = parameter;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getVmParam() {
        return vmParam;
    }

    public void setVmParam(String vmParam) {
        this.vmParam = vmParam;
    }

    public String getJarPath() {
        return jarPath;
    }

    public void setJarPath(String jarPath) {
        this.jarPath = jarPath;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
