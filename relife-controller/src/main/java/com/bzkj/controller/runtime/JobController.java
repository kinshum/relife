package com.bzkj.controller.runtime;

import com.bzkj.entity.JobModel;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;

@Api(tags = "Job")
public interface JobController {

    @ApiOperation("保存")
    @PostMapping("/api/v1/quartz/save")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", required = true, name = "jobName", value = "job名称"),
            @ApiImplicitParam(paramType = "query", required = true, name = "description", value = "job描述"),
            @ApiImplicitParam(paramType = "query", required = true, name = "cron", value = "cron正则表达式"),
            @ApiImplicitParam(paramType = "query", required = true, name = "springBeanName", value = "springBean名"),
            @ApiImplicitParam(paramType = "query", required = true, name = "methodName", value = "方法名"),
            @ApiImplicitParam(paramType = "query", required = true, name = "isSysJob", value = "是否是系统job")
    })
    void save(JobModel jobModel);


}
