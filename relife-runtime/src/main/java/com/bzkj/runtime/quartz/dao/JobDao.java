package com.bzkj.runtime.quartz.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.bzkj.entity.JobModel;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface JobDao{

	@Options(useGeneratedKeys = true, keyProperty = "id")
	@Insert("insert into t_job(jobName, description, cron, springBeanName, methodName, isSysJob, status, createTime, updateTime) values(#{jobName}, #{description}, #{cron}, #{springBeanName}, #{methodName}, #{isSysJob}, 1, now(), now())")
	int save(JobModel jobModel);

	@Select("select * from t_job t where t.id = #{id}")
	JobModel getById(Long id);

	@Select("select * from t_job t where t.jobName = #{jobName}")
	JobModel getByName(String jobName);

	int update(JobModel jobModel);

	int count(@Param("params") Map<String, Object> params);

	List<JobModel> list(@Param("params") Map<String, Object> params, @Param("offset") Integer offset,
                        @Param("limit") Integer limit);
}
