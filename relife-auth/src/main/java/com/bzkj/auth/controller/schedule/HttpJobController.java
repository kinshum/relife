package com.bzkj.auth.controller.schedule;


import com.alibaba.dubbo.config.annotation.Reference;
import com.bzkj.auth.controller.base.BaseController;
import com.bzkj.entity.HttpJobLogs;
import com.bzkj.entity.Page;
import com.bzkj.entity.param.AddHttpJobParam;
import com.bzkj.entity.vo.HttpJobDetailVO;
import com.bzkj.facade.schedule.HttpJobService;
import com.bzkj.facade.schedule.JobManageService;
import com.bzkj.rsp.Response;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * @description: Http类型任务Controller
 * @author: jensen
 * @date: created by 2019/9/15 2:09
 */
@Api(tags = "httpJob")
@RestController
@RequestMapping(value = "/api/v1/httpJob")
public class HttpJobController extends BaseController {

    @Reference
    private HttpJobService httpJobService;

    @Reference
    private JobManageService jobManageService;

    @ApiOperation("job任务添加")
    @PostMapping("/add")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", required = true, name = "jobName", value = "任务名称"),
            @ApiImplicitParam(paramType = "query", required = true, name = "jobGroup", value = "任务组"),
            @ApiImplicitParam(paramType = "query", required = true, name = "description", value = "任务描述"),
            @ApiImplicitParam(paramType = "query", required = true, name = "requestType", value = "请求类型"),
            @ApiImplicitParam(paramType = "query", required = true, name = "url", value = "url"),
            @ApiImplicitParam(paramType = "query", required = true, name = "params", value = "参数"),
            @ApiImplicitParam(paramType = "query", required = true, name = "cronExpression", value = "cron表达式")
    })
    public Response addPostJsonJob(String jobName, String jobGroup, String description,
                                   String requestType, String url, String params, String cronExpression) {
        AddHttpJobParam addHttpJobParam = new AddHttpJobParam();
        addHttpJobParam.setCronExpression(cronExpression);
        addHttpJobParam.setDescription(description);
        addHttpJobParam.setJobGroup(jobGroup);
        addHttpJobParam.setJobName(jobName);
        addHttpJobParam.setParams(params);
        addHttpJobParam.setRequestType(requestType);
        addHttpJobParam.setUrl(url);
        httpJobService.addHttpJob(addHttpJobParam);
        return Response.success();
    }


    @ApiOperation("job任务列表")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", name = "searchParam", value = "查询参数"),
            @ApiImplicitParam(paramType = "query", required = true, name = "pageSize", defaultValue = "15", value = "每页条数"),
            @ApiImplicitParam(paramType = "query", required = true, name = "pageNum", defaultValue = "1", value = "页码")
    })
    @GetMapping(value = "/jobs")
    public Response<Page<HttpJobDetailVO>> getJobs(String searchParam, Integer pageSize, Integer pageNum) {
        Page<HttpJobDetailVO> result = httpJobService.getHttpJobs(searchParam, pageSize, pageNum);
        return Response.success(result);
    }


    @ApiOperation("job任务删除")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", required = true, name = "jobName", value = "任务名称"),
            @ApiImplicitParam(paramType = "query", required = true, name = "jobGroup", value = "任务组")
    })
    @PostMapping("/delete")
    public Response deleteJob(String jobName, String jobGroup) {
        jobManageService.deleteJob(jobName, jobGroup);
        return Response.success();
    }

    @ApiOperation("job任务恢复")
    @PostMapping("/resume")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", required = true, name = "jobName", value = "任务名称"),
            @ApiImplicitParam(paramType = "query", required = true, name = "jobGroup", value = "任务组")
    })
    public Response resumeJob(String jobName, String jobGroup) {
        jobManageService.resumeJob(jobName, jobGroup);
        return Response.success();
    }

    @ApiOperation("job任务暂停")
    @PostMapping("/pause")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", required = true, name = "jobName", value = "任务名称"),
            @ApiImplicitParam(paramType = "query", required = true, name = "jobGroup", value = "任务组")
    })
    public Response pauseJob(String jobName, String jobGroup) {
        jobManageService.pauseJob(jobName, jobGroup);
        return Response.success();
    }

    @ApiOperation("job任务更新")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", required = true, name = "jobName", value = "任务名称"),
            @ApiImplicitParam(paramType = "query", required = true, name = "jobGroup", value = "任务组"),
            @ApiImplicitParam(paramType = "query", required = true, name = "cronExpression", value = "cron表达式")
    })
    @PostMapping("/update")
    public Response updateJob(String jobName, String jobGroup, String cronExpression) {
        jobManageService.updateCronExpression(jobName, jobGroup, cronExpression);
        return Response.success();
    }


   /* @RequestMapping(value = "/historyJobs")
    public Response<Page<HttpJobDetailVO>> getHistoryJobs(@RequestParam(name = "searchParam", required = false) String searchParam,
                                                          @RequestParam(name = "pageSize", required = false, defaultValue = "15") Integer pageSize,
                                                          @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum) {

        Page<HttpJobDetailVO> result = httpJobService.getHistoryHttpJobs(searchParam, pageSize, pageNum);
        return Response.success(result);

    }

    @RequestMapping(value = "/jobLogs")
    public Response<Page<HttpJobLogs>> getJobLogs(@RequestParam(name = "jobName", required = false) String jobName,
                                                  @RequestParam(name = "jobGroup", required = false) String jobGroup,
                                                  @RequestParam(name = "searchParam", required = false) String searchParam,
                                                  @RequestParam(name = "pageSize", required = false, defaultValue = "15") Integer pageSize,
                                                  @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum) {

        Page<HttpJobLogs> result = httpJobService.getHttpJobLogs(jobName, jobGroup, searchParam, pageSize, pageNum);
        return Response.success(result);
    }*/


}
