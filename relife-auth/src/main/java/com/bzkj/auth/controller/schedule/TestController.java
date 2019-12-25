package com.bzkj.auth.controller.schedule;

import com.alibaba.dubbo.config.annotation.Reference;
import com.bzkj.auth.controller.base.BaseController;
import com.bzkj.entity.SysLogs;
import com.bzkj.facade.cms.SysLogService;
import com.bzkj.facade.schedule.JobManageService;

import com.bzkj.rsp.Result;
import com.bzkj.utils.JsonUtil;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/quartz/test")
public class TestController extends BaseController {


    @Reference
    private JobManageService jobManageService;

    @Reference
    private SysLogService logService;

    @GetMapping(value = "/logList")
    public Result getLogList(@RequestParam(name = "limit",defaultValue ="14" ) int limit) {
        List<SysLogs> logList = logService.getLogList(limit);
        logger.info("定时任务返回参数->{}",JsonUtil.getJsonString(logList));
        return Result.newSuccessResult();
    }


}
