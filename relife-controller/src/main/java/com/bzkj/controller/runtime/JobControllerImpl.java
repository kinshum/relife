package com.bzkj.controller.runtime;

import com.alibaba.dubbo.config.annotation.Reference;
import com.bzkj.controller.base.BaseController;
import com.bzkj.entity.JobModel;
import com.bzkj.facade.runtime.JobService;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class JobControllerImpl extends BaseController implements JobController {

    @Reference
    private JobService jobService;

    @Override
    public void save(JobModel jobModel) {
        jobService.saveJob(jobModel);
    }
}
