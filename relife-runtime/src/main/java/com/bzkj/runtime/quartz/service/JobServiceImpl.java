package com.bzkj.runtime.quartz.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.bzkj.entity.JobModel;
import com.bzkj.facade.runtime.JobService;
import com.bzkj.runtime.quartz.config.SpringBeanJob;
import com.bzkj.runtime.quartz.dao.JobDao;
import org.quartz.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.support.AopUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

@Service(interfaceClass = JobService.class)
@org.springframework.stereotype.Service
public class JobServiceImpl implements JobService {

    private static final Logger logger = LoggerFactory.getLogger("runtimeLogger");

    @Autowired
    private Scheduler scheduler;
    @Autowired
    private ApplicationContext applicationContext;

    private static final String JOB_DATA_KEY = "JOB_DATA_KEY";
    @Autowired
    private JobDao jobDao;

    @Override
    public void saveJob(JobModel jobModel) {
        checkJobModel(jobModel);
        String name = jobModel.getJobName();
        JobKey jobKey = JobKey.jobKey(name);
        JobDetail jobDetail = JobBuilder.newJob(SpringBeanJob.class).storeDurably()
                .withDescription(jobModel.getDescription()).withIdentity(jobKey).build();

        jobDetail.getJobDataMap().put(JOB_DATA_KEY, jobModel);

        CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule(jobModel.getCron());
        CronTrigger cronTrigger = TriggerBuilder.newTrigger().withIdentity(name).withSchedule(cronScheduleBuilder)
                .forJob(jobKey).build();

        try {
            boolean exists = scheduler.checkExists(jobKey);
            if (exists) {
                scheduler.rescheduleJob(new TriggerKey(name), cronTrigger);
                scheduler.addJob(jobDetail, true);
            } else {
                scheduler.scheduleJob(jobDetail, cronTrigger);
            }

            JobModel model = jobDao.getByName(name);
            if (model == null) {
                jobDao.save(jobModel);
            } else {
                jobDao.update(jobModel);
            }
        } catch (SchedulerException e) {
            logger.error("新增或修改job异常", e);
        }
    }

    private void checkJobModel(JobModel jobModel) {
        String springBeanName = jobModel.getSpringBeanName();
        boolean flag = applicationContext.containsBean(springBeanName);
        if (!flag) {
            throw new IllegalArgumentException("bean：" + springBeanName + "不存在，bean名如userServiceImpl,首字母小写");
        }

        Object object = applicationContext.getBean(springBeanName);
        Class<?> clazz = object.getClass();
        if (AopUtils.isAopProxy(object)) {
            clazz = clazz.getSuperclass();
        }

        String methodName = jobModel.getMethodName();
        Method[] methods = clazz.getDeclaredMethods();

        Set<String> names = new HashSet<>();
        Arrays.asList(methods).parallelStream().forEach(m -> {
            Class<?>[] classes = m.getParameterTypes();
            if (classes.length == 0) {
                names.add(m.getName());
            }
        });

        if (names.size() == 0) {
            throw new IllegalArgumentException("该bean没有无参方法");
        }

        if (!names.contains(methodName)) {
            throw new IllegalArgumentException("未找到无参方法" + methodName + ",该bean所有方法名为：" + names);
        }
    }


    @Override
    public void doJob(JobDataMap jobDataMap) {

    }

    @Override
    public void deleteJob(Long id) throws SchedulerException {

    }
}
