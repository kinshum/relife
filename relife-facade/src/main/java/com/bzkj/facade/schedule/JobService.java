package com.bzkj.facade.schedule;

import com.bzkj.entity.JobEntity;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Trigger;

import java.util.List;

public interface JobService {

     JobEntity getJobEntityById(Integer id);

     List<JobEntity> loadJobs();

     JobKey getJobKey(JobEntity entity);

     JobDataMap getJobDataMap(JobEntity entity);

     JobDetail getJobDetail(JobKey jobKey, String description, JobDataMap map);

     Trigger getTrigger(JobEntity entity);

     void save(JobEntity job);
}
