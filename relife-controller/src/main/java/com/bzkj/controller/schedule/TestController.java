package com.bzkj.controller.schedule;

import com.alibaba.dubbo.config.annotation.Reference;
import com.bzkj.facade.schedule.JobManageService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/quartz/test")
public class TestController {


    @Reference
    private JobManageService jobManageService;


    @GetMapping(value = "/get")
    public String test(@RequestParam("id") String id) {
        System.out.println(">>>>>>>>>"+id);
        return "测试id:"+id;
    }


}
