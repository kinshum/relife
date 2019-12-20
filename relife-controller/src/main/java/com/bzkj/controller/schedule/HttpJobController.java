package com.bzkj.controller.schedule;


import com.alibaba.dubbo.config.annotation.Reference;
import com.bzkj.entity.HttpJobLogs;
import com.bzkj.entity.Page;
import com.bzkj.entity.param.AddHttpJobParam;
import com.bzkj.entity.vo.HttpJobDetailVO;
import com.bzkj.facade.schedule.HttpJobService;
import com.bzkj.rsp.Response;
import com.bzkj.rsp.Result;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * @description: Http类型任务Controller
 * @author: jensen
 * @date: created by 2019/9/15 2:09
 */
@RestController
@RequestMapping(value = "/quartz/httpJob")
public class HttpJobController {

    @Reference
    private HttpJobService httpJobService;

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public Response addPostJsonJob(@RequestBody @Valid AddHttpJobParam addHttpJobParam) {
        httpJobService.addHttpJob(addHttpJobParam);
        return Response.success();
    }

    @RequestMapping(value = "/jobs")
    public Response<Page<HttpJobDetailVO>> getJobs(@RequestParam(name = "searchParam", required = false) String searchParam,
                                                 @RequestParam(name = "pageSize", required = false, defaultValue = "15") Integer pageSize,
                                                 @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum) {

        Page<HttpJobDetailVO> result = httpJobService.getHttpJobs(searchParam, pageSize, pageNum);
        return Response.success(result);
    }

    @RequestMapping(value = "/historyJobs")
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
    }

}
