package com.bzkj.runtime.schedule.dao;

import com.bzkj.entity.HttpJobLogs;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface HttpJobLogsDao {

    int insertSelective(HttpJobLogs httpJobLogs);

    List<HttpJobLogs> selectHttpJobLogs(Map<String, Object> map);

    Integer selectHttpJobLogsCount(Map<String, Object> map);
}
