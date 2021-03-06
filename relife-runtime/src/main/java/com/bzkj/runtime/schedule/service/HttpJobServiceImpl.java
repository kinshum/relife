package com.bzkj.runtime.schedule.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSON;
import com.bzkj.constants.GlobalConstants;
import com.bzkj.entity.HttpJobDetails;
import com.bzkj.entity.HttpJobLogs;
import com.bzkj.entity.Page;
import com.bzkj.entity.param.AddHttpJobParam;
import com.bzkj.entity.vo.HttpJobDetailVO;
import com.bzkj.exception.CommonBizException;
import com.bzkj.exception.ExpCodeEnum;
import com.bzkj.facade.schedule.HttpJobService;
import com.bzkj.runtime.schedule.dao.HttpJobDetailsDao;
import com.bzkj.runtime.schedule.dao.HttpJobLogsDao;
import com.bzkj.runtime.schedule.job.HttpGetJob;
import com.bzkj.runtime.schedule.job.HttpPostFormDataJob;
import com.bzkj.runtime.schedule.job.HttpPostJsonJob;
import com.bzkj.utils.JobUtil;
import com.bzkj.utils.JsonValidUtil;
import org.apache.commons.lang3.StringUtils;
import org.quartz.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Http类型任务Service
 *
 * @author jensen
 * @date 2019/4/9
 */

@org.springframework.stereotype.Service
@Service(interfaceClass = HttpJobService.class)
public class HttpJobServiceImpl implements HttpJobService {

    private static final Logger logger = LoggerFactory.getLogger("runtimeLogger");

    @Autowired
    private Scheduler scheduler;

    @Autowired
    private HttpJobLogsDao httpJobLogsDao;

    @Autowired
    private HttpJobDetailsDao httpJobDetailsDao;

    @Autowired
    private JobUtil jobUtil;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void addHttpJob(AddHttpJobParam addHttpJobParam) {

        String jobName = addHttpJobParam.getJobName();
        String jobGroup = addHttpJobParam.getJobGroup();
        HttpJobDetails httpJobDetails = httpJobDetailsDao.selectByJobNameAndJobGroup(jobName, jobGroup);
        if (httpJobDetails != null) {
            //通过jobName和jobGroup确保任务的唯一性
            throw new RuntimeException("任务名称重复!");
        }

        String requestType = addHttpJobParam.getRequestType();
        String description = addHttpJobParam.getDescription();
        String cronExpression = addHttpJobParam.getCronExpression();
        String url = addHttpJobParam.getUrl();
        String jsonParamsStr = addHttpJobParam.getParams();

        httpJobDetails = new HttpJobDetails();
        httpJobDetails.setJobName(jobName);
        httpJobDetails.setJobGroup(jobGroup);
        httpJobDetails.setDescription(description);
        httpJobDetails.setRequestType(requestType);
        httpJobDetails.setHttpUrl(url);
        if (!JsonValidUtil.isJson(jsonParamsStr)) {
            throw new CommonBizException(ExpCodeEnum.PARAMS_JSON_ERROR);
        }

        Map<String, Object> jobParamsMap = new HashMap<>();
        jobParamsMap.put(GlobalConstants.URL, url);
        jobParamsMap.put(GlobalConstants.PARAMS, jsonParamsStr);

        JobDetail jobDetail = null;
        //根据不同类型的job构建job信息
        switch (requestType) {
            //postJson
            case GlobalConstants.POST_JSON:
                jobDetail = JobBuilder.newJob(HttpPostJsonJob.class)
                        .withIdentity(jobName, jobGroup)
                        .build();

                //jsonStr的参数直接用
                if (StringUtils.isNotEmpty(jsonParamsStr)) {
                    httpJobDetails.setHttpParams(jsonParamsStr);
                }
                break;

            //postFormData
            case GlobalConstants.POST_FORM_DATA:
                jobDetail = JobBuilder.newJob(HttpPostFormDataJob.class)
                        .withIdentity(jobName, jobGroup)
                        .build();

                //jsonStr参数转为formData的Map
                Map<String, Object> formDataParamMap;
                if (StringUtils.isEmpty(jsonParamsStr)) {
                    formDataParamMap = null;
                } else {
                    formDataParamMap = JSON.parseObject(jsonParamsStr, Map.class);
                    httpJobDetails.setHttpParams(formDataParamMap.toString());
                }
                jobParamsMap.put(GlobalConstants.PARAMS, formDataParamMap);

                break;

            //get
            case GlobalConstants.GET:
                jobDetail = JobBuilder.newJob(HttpGetJob.class)
                        .withIdentity(jobName, jobGroup)
                        .build();

                //jsonStr参数转为formData的Map
                Map<String, Object> paramMap;
                if (StringUtils.isEmpty(jsonParamsStr)) {
                    paramMap = null;
                } else {
                    paramMap = JSON.parseObject(jsonParamsStr, Map.class);
                    httpJobDetails.setHttpParams(paramMap.toString());
                }
                jobParamsMap.put(GlobalConstants.PARAMS, paramMap);

                break;
        }

        //任务信息
        jobDetail.getJobDataMap().putAll(jobParamsMap);
        jobDetail.getJobDataMap().put(GlobalConstants.REQUEST_TYPE, requestType);

        //表达式调度构建器(即任务执行的时间)
        CronScheduleBuilder scheduleBuilder;
        try {
            scheduleBuilder = CronScheduleBuilder.cronSchedule(cronExpression);
        } catch (Exception e) {
            throw new RuntimeException("Illegal CronExpression!");
        }

        TriggerKey triggerKey = jobUtil.getTriggerKeyByJob(jobName, jobGroup);

        //构建一个trigger
        CronTrigger trigger = TriggerBuilder.newTrigger()
                .withIdentity(triggerKey)
                .startNow()
                .withSchedule(scheduleBuilder).build();

        try {
            // 调度容器设置JobDetail和Trigger
            scheduler.scheduleJob(jobDetail, trigger);
            // 启动
            if (!scheduler.isShutdown()) {
                scheduler.start();
            }
        } catch (Exception e) {
            throw new RuntimeException("Schedule Exception.", e);
        }

        httpJobDetailsDao.insertSelective(httpJobDetails);
        logger.info("Success in addJob, [{}]-[{}]", jobName, jobGroup);

    }

    @Override
    public Page<HttpJobDetailVO> getHttpJobs(String searchParam, Integer pageSize, Integer pageNum) {
        Integer beginIndex = (pageNum - 1) * pageSize;

        Map<String, Object> sqlMap = new HashMap<>();
        sqlMap.put("searchParam", searchParam);
        sqlMap.put("pageSize", pageSize);
        sqlMap.put("beginIndex", beginIndex);

        List<HttpJobDetailVO> httpJobDetailVOList = httpJobDetailsDao.selectHttpJobs(sqlMap);

        for (HttpJobDetailVO httpJobDetailVO : httpJobDetailVOList) {
            //设置jobStatusInfo
            String jobStatusInfo = jobUtil.getJobStatusInfo(httpJobDetailVO.getJobName(), httpJobDetailVO.getJobGroup());
            httpJobDetailVO.setJobStatusInfo(jobStatusInfo);
            //任务状态正常，根据cron表达式计算下次运行时间
            if (StringUtils.equals(jobStatusInfo, GlobalConstants.JOB_STATUS_NORMAL)) {
                httpJobDetailVO.setNextFireTime(jobUtil.getNextFireDate(httpJobDetailVO.getCronExpression()));
            }
        }

        Page<HttpJobDetailVO> httpJobDetailVOPageVO = new Page<>();
        httpJobDetailVOPageVO.setPageNum(pageNum);
        httpJobDetailVOPageVO.setPageSize(pageSize);
        httpJobDetailVOPageVO.setCount(httpJobDetailVOList.size());
        httpJobDetailVOPageVO.setTotalCount(httpJobDetailsDao.selectHttpJobsCount(sqlMap));
        httpJobDetailVOPageVO.setResultList(httpJobDetailVOList);
        return httpJobDetailVOPageVO;
    }

    @Override
    public Page<HttpJobDetailVO> getHistoryHttpJobs(String searchParam, Integer pageSize, Integer pageNum) {
        Integer beginIndex = (pageNum - 1) * pageSize;

        Map<String, Object> sqlMap = new HashMap<>();
        sqlMap.put("searchParam", searchParam);
        sqlMap.put("pageSize", pageSize);
        sqlMap.put("beginIndex", beginIndex);

        List<HttpJobDetailVO> httpJobDetailVOList = httpJobDetailsDao.selectHistoryHttpJobs(sqlMap);

        Page<HttpJobDetailVO> httpJobDetailVOPageVO = new Page<>();
        httpJobDetailVOPageVO.setPageNum(pageNum);
        httpJobDetailVOPageVO.setPageSize(pageSize);
        httpJobDetailVOPageVO.setCount(httpJobDetailVOList.size());
        httpJobDetailVOPageVO.setTotalCount(httpJobDetailsDao.selectHistoryHttpJobsCount(sqlMap));
        httpJobDetailVOPageVO.setResultList(httpJobDetailVOList);

        return httpJobDetailVOPageVO;
    }

    @Override
    public Page<HttpJobLogs> getHttpJobLogs(String jobName, String jobGroup, String searchParam, Integer pageSize, Integer pageNum) {
        Integer beginIndex = (pageNum - 1) * pageSize;

        Map<String, Object> sqlMap = new HashMap<>();
        sqlMap.put("jobName", jobName);
        sqlMap.put("jobGroup", jobGroup);
        sqlMap.put("searchParam", searchParam);
        sqlMap.put("pageSize", pageSize);
        sqlMap.put("beginIndex", beginIndex);

        List<HttpJobLogs> httpJobLogsList = httpJobLogsDao.selectHttpJobLogs(sqlMap);

        Page<HttpJobLogs> httpJobDetailVOPageVO = new Page<>();
        httpJobDetailVOPageVO.setPageNum(pageNum);
        httpJobDetailVOPageVO.setPageSize(pageSize);
        httpJobDetailVOPageVO.setCount(httpJobLogsList.size());
        httpJobDetailVOPageVO.setTotalCount(httpJobLogsDao.selectHttpJobLogsCount(sqlMap));
        httpJobDetailVOPageVO.setResultList(httpJobLogsList);

        return httpJobDetailVOPageVO;
    }

}
