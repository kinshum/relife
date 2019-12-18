package com.bzkj.schedule.service;


import com.bzkj.entity.JobEntity;
import com.bzkj.facade.schedule.JobService;
import com.bzkj.schedule.dao.JobDao;
import com.bzkj.schedule.job.DynamicJob;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by EalenXie on 2018/6/4 14:25
 */
@Service
public class JobServiceImpl implements JobService {

    @Autowired
    private JobDao jobDao;




    @Override
    public JobEntity getJobEntityById(Integer id) {
        return jobDao.selectById(id);
    }

    @Override
    public List<JobEntity> loadJobs() {
        return jobDao.findAll();
    }

    /**
     * 获取JobDataMap.(Job参数对象)
     * @param job
     * @return
     */
    @Override
    public JobDataMap getJobDataMap(JobEntity job) {
        JobDataMap map = new JobDataMap();
        map.put("name", job.getName());
        map.put("jobGroup", job.getJobGroup());
        map.put("cronExpression", job.getCron());
        map.put("parameter", job.getParameter());
        map.put("jobDescription", job.getDescription());
        map.put("vmParam", job.getVmParam());
        map.put("jarPath", job.getJarPath());
        map.put("status", job.getStatus());
        return map;
    }

    /**
     * 获取JobDetail,JobDetail是任务的定义,而Job是任务的执行逻辑,JobDetail里会引用一个Job Class来定义
     * @param jobKey
     * @param description
     * @param map
     * @return
     */
    @Override
    public JobDetail getJobDetail(JobKey jobKey, String description, JobDataMap map) {
        return JobBuilder.newJob(DynamicJob.class)
                .withIdentity(jobKey)
                .withDescription(description)
                .setJobData(map)
                .storeDurably()
                .build();
    }

    /**
     * 获取Trigger (Job的触发器,执行规则)s
     * @param job
     * @return
     */
    @Override
    public Trigger getTrigger(JobEntity job) {
        return TriggerBuilder.newTrigger()
                .withIdentity(job.getName(), job.getJobGroup())
                .withSchedule(CronScheduleBuilder.cronSchedule(job.getCron()))
                .build();
    }

    @Override
    public void save(JobEntity job) {
        jobDao.insert(job);
    }

    /**
     *
     * @param job
     * @return
     */
    @Override
    public JobKey getJobKey(JobEntity job) {
        return JobKey.jobKey(job.getName(), job.getJobGroup());
    }



}
