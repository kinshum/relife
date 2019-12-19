package com.bzkj.schedule.dao;


import com.bzkj.entity.HttpJobDetails;
import com.bzkj.entity.vo.HttpJobDetailVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface HttpJobDetailsMapper {

    HttpJobDetails selectByJobNameAndJobGroup(@Param("jobName") String jobName, @Param("jobGroup") String jobGroup);

    int insertSelective(HttpJobDetails httpJobDetails);

    List<HttpJobDetailVO> selectHttpJobs(Map<String, Object> map);

    Integer selectHttpJobsCount(Map<String, Object> map);

    List<HttpJobDetailVO> selectHistoryHttpJobs(Map<String, Object> map);

    Integer selectHistoryHttpJobsCount(Map<String, Object> map);

}
