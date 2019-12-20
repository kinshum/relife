package com.bzkj.controller.schedule;


import com.alibaba.dubbo.config.annotation.Reference;
import com.bzkj.controller.base.BaseController;
import com.bzkj.facade.schedule.JobManageService;
import com.bzkj.rsp.Response;
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
public class JobController extends BaseController {

    @Reference
    private JobManageService jobManageService;

    @RequestMapping(value = "/pause", method = RequestMethod.POST)
    public Response pauseJob(@RequestParam(name = "jobName") String jobName,
                           @RequestParam(name = "jobGroup") String jobGroup) {

        jobManageService.pauseJob(jobName, jobGroup);
        return Response.success();
    }

    @RequestMapping(value = "/resume", method = RequestMethod.POST)
    public Response resumeJob(@RequestParam(name = "jobName") String jobName,
                            @RequestParam(name = "jobGroup") String jobGroup) {

        jobManageService.resumeJob(jobName, jobGroup);
        return Response.success();
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public Response deleteJob(@RequestParam(name = "jobName") String jobName,
                            @RequestParam(name = "jobGroup") String jobGroup) {

        jobManageService.deleteJob(jobName, jobGroup);
        return Response.success();
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public Response updateJob(@RequestParam(name = "jobName") String jobName,
                            @RequestParam(name = "jobGroup") String jobGroup,
                            @RequestParam(name = "cronExpression") String cronExpression) {

        jobManageService.updateCronExpression(jobName, jobGroup, cronExpression);
        return Response.success();
    }

}
