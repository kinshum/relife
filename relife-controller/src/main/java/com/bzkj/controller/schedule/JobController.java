package com.bzkj.controller.schedule;


import com.alibaba.dubbo.config.annotation.Reference;
import com.bzkj.facade.schedule.JobManageService;
import com.bzkj.rsp.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @description: job操作Controller
 * @author: jensen
 * @date: created by 2019/9/11 2:09
 */
@RestController
@RequestMapping(value = "/quartz/job")
public class JobController {

    @Reference
    private JobManageService jobManageService;

    @RequestMapping(value = "/pause", method = RequestMethod.POST)
    public Result pauseJob(@RequestParam(name = "jobName") String jobName,
                           @RequestParam(name = "jobGroup") String jobGroup) {

        jobManageService.pauseJob(jobName, jobGroup);
        return Result.newSuccessResult();
    }

    @RequestMapping(value = "/resume", method = RequestMethod.POST)
    public Result resumeJob(@RequestParam(name = "jobName") String jobName,
                            @RequestParam(name = "jobGroup") String jobGroup) {

        jobManageService.resumeJob(jobName, jobGroup);
        return Result.newSuccessResult();
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public Result deleteJob(@RequestParam(name = "jobName") String jobName,
                            @RequestParam(name = "jobGroup") String jobGroup) {

        jobManageService.deleteJob(jobName, jobGroup);
        return Result.newSuccessResult();
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Result updateJob(@RequestParam(name = "jobName") String jobName,
                            @RequestParam(name = "jobGroup") String jobGroup,
                            @RequestParam(name = "cronExpression") String cronExpression) {

        jobManageService.updateCronExpression(jobName, jobGroup, cronExpression);
        return Result.newSuccessResult();
    }

}
