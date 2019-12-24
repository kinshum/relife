package com.bzkj.auth.controller.schedule;


import com.alibaba.dubbo.config.annotation.Reference;
import com.bzkj.auth.controller.base.BaseController;
import com.bzkj.entity.Page;
import com.bzkj.entity.param.AddHttpJobParam;
import com.bzkj.entity.vo.HttpJobDetailVO;
import com.bzkj.facade.schedule.HttpJobService;
import com.bzkj.facade.schedule.JobManageService;
import com.bzkj.rsp.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description: quartz
 * @author: jensen
 * @date: created by 2019/9/15 2:09
 */
@Api(tags = "quartz")
@RestController
@RequestMapping(value = "/api/v1/quartz")
public class QuartzController extends BaseController {

    @Reference
    private HttpJobService httpJobService;

    @Reference
    private JobManageService jobManageService;

    @PostMapping("/add")
    @ApiOperation("job任务添加")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", required = true, name = "jobName", value = "任务名称"),
            @ApiImplicitParam(paramType = "query", required = true, name = "jobGroup", value = "任务组"),
            @ApiImplicitParam(paramType = "query", required = true, name = "description", value = "任务描述"),
            @ApiImplicitParam(paramType = "query", required = true, name = "requestType", value = "请求类型"),
            @ApiImplicitParam(paramType = "query", required = true, name = "url", value = "url"),
            @ApiImplicitParam(paramType = "query", required = true, name = "params", value = "参数"),
            @ApiImplicitParam(paramType = "query", required = true, name = "cronExpression", value = "cron表达式")
    })
    public Result addPostJsonJob(String jobName, String jobGroup, String description,
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
        return Result.newSuccessResult();
    }

    @GetMapping(value = "/jobs")
    @ApiOperation("job任务列表")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", name = "searchParam", value = "查询参数"),
            @ApiImplicitParam(paramType = "query", required = true, name = "pageSize", defaultValue = "15", value = "每页条数"),
            @ApiImplicitParam(paramType = "query", required = true, name = "pageNum", defaultValue = "1", value = "页码")
    })
    public Result<Page<HttpJobDetailVO>> getJobs(String searchParam, Integer pageSize, Integer pageNum) {
        Page<HttpJobDetailVO> result = httpJobService.getHttpJobs(searchParam, pageSize, pageNum);
        return Result.newSuccessResult(result);
    }

    @PostMapping("/delete")
    @ApiOperation("job任务删除")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", required = true, name = "jobName", value = "任务名称"),
            @ApiImplicitParam(paramType = "query", required = true, name = "jobGroup", value = "任务组")
    })
    public Result deleteJob(String jobName, String jobGroup) {
        jobManageService.deleteJob(jobName, jobGroup);
        return Result.newSuccessResult();
    }

    @PostMapping("/resume")
    @ApiOperation("job任务恢复")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", required = true, name = "jobName", value = "任务名称"),
            @ApiImplicitParam(paramType = "query", required = true, name = "jobGroup", value = "任务组")
    })
    public Result resumeJob(String jobName, String jobGroup) {
        jobManageService.resumeJob(jobName, jobGroup);
        return Result.newSuccessResult();
    }

    @PostMapping("/pause")
    @ApiOperation("job任务暂停")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", required = true, name = "jobName", value = "任务名称"),
            @ApiImplicitParam(paramType = "query", required = true, name = "jobGroup", value = "任务组")
    })
    public Result pauseJob(String jobName, String jobGroup) {
        jobManageService.pauseJob(jobName, jobGroup);
        return Result.newSuccessResult();
    }

    @PostMapping("/update")
    @ApiOperation("job任务更新")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", required = true, name = "jobName", value = "任务名称"),
            @ApiImplicitParam(paramType = "query", required = true, name = "jobGroup", value = "任务组"),
            @ApiImplicitParam(paramType = "query", required = true, name = "cronExpression", value = "cron表达式")
    })
    public Result updateJob(String jobName, String jobGroup, String cronExpression) {
        jobManageService.updateCronExpression(jobName, jobGroup, cronExpression);
        return Result.newSuccessResult();
    }

}
