package com.bzkj.runtime.schedule.job;


import com.bzkj.constants.GlobalConstants;
import com.bzkj.entity.HttpJobLogs;
import com.bzkj.runtime.schedule.dao.HttpJobLogsDao;
import com.bzkj.utils.HttpClientUtil;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;

@DisallowConcurrentExecution
public class HttpPostJsonJob implements Job {

    private Logger logger = LoggerFactory.getLogger("runtimeLogger");

    @Autowired
    private HttpJobLogsDao httpJobLogsDao;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) {
        JobDetail jobDetail = jobExecutionContext.getJobDetail();
        String jobName = jobDetail.getKey().getName();
        String jobGroup = jobDetail.getKey().getGroup();

        Map<String, Object> jobParamsMap = jobDetail.getJobDataMap();

        String requestType = (String) jobParamsMap.get(GlobalConstants.REQUEST_TYPE);
        String url = (String) jobParamsMap.get(GlobalConstants.URL);
        String jsonParam = (String) jobParamsMap.get(GlobalConstants.PARAMS);

        HttpJobLogs httpJobLogs = new HttpJobLogs();
        httpJobLogs.setJobName(jobName);
        httpJobLogs.setJobGroup(jobGroup);
        httpJobLogs.setRequestType(requestType);
        httpJobLogs.setHttpUrl(url);
        httpJobLogs.setHttpParams(jsonParam);
        String result = HttpClientUtil.postJson(url, jsonParam);
        httpJobLogs.setResult(result);
        logger.info("Success in execute [{}_{}]", jobName, jobGroup);
        httpJobLogsDao.insertSelective(httpJobLogs);
    }

}
