package com.bzkj.schedule.service;


import com.alibaba.dubbo.config.annotation.Service;
import com.bzkj.constants.GlobalConstants;
import com.bzkj.facade.schedule.JobManageService;

import com.bzkj.schedule.job.JobUtil;
import org.apache.commons.lang3.StringUtils;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Autowired;


import javax.annotation.Resource;

@org.springframework.stereotype.Service
@Service(interfaceClass = JobManageService.class)
public class JobManageServiceImpl implements JobManageService {

    @Autowired
    private Scheduler scheduler;

    @Resource
    private JobUtil jobUtil;

    @Override
    public void pauseJob(String jobName, String jobGroup) {
        String jobStatusInfo = jobUtil.getJobStatusInfo(jobName, jobGroup);
        if (StringUtils.equals(jobStatusInfo, GlobalConstants.JOB_STATUS_PAUSED)) {
            throw new RuntimeException("当前任务已是暂停状态!");
        }
        JobKey jobKey = JobKey.jobKey(jobName, jobGroup);
        try {
            scheduler.pauseJob(jobKey);
        } catch (SchedulerException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void resumeJob(String jobName, String jobGroup) {
        String jobStatusInfo = jobUtil.getJobStatusInfo(jobName, jobGroup);
        if (!StringUtils.equals(jobStatusInfo, GlobalConstants.JOB_STATUS_PAUSED)) {
            throw new RuntimeException("任务仅在暂停状态时才能恢复!");
        }
        JobKey jobKey = JobKey.jobKey(jobName, jobGroup);
        try {
            scheduler.resumeJob(jobKey);
        } catch (SchedulerException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteJob(String jobName, String jobGroup) {
        JobKey jobKey = JobKey.jobKey(jobName, jobGroup);
        TriggerKey triggerKey = jobUtil.getTriggerKeyByJob(jobName, jobGroup);
        try {
            scheduler.pauseTrigger(triggerKey);
            scheduler.unscheduleJob(triggerKey);
            scheduler.deleteJob(jobKey);
        } catch (SchedulerException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateCronExpression(String jobName, String jobGroup, String cronExpression) {
        TriggerKey triggerKey = jobUtil.getTriggerKeyByJob(jobName, jobGroup);

        //表达式调度构建器(即任务执行的时间)
        CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(cronExpression);

        //按新的cronExpression重新构建trigger
        CronTrigger trigger = TriggerBuilder.newTrigger()
                .withIdentity(triggerKey)
                .withSchedule(scheduleBuilder).build();
        try {
            scheduler.rescheduleJob(triggerKey, trigger);
        } catch (SchedulerException e) {
            throw new RuntimeException(e);
        }

    }

}
