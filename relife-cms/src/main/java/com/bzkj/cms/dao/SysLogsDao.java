package com.bzkj.cms.dao;


import com.bzkj.entity.SysLogs;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

@Mapper
public interface SysLogsDao {

	@Insert("insert into sys_logs(userId, module, flag, remark, createTime) values(#{user.id}, #{module}, #{flag}, #{remark}, now())")
	int save(SysLogs sysLogs);

	int count(@Param("params") Map<String, Object> params);

	List<SysLogs> list(@Param("params") Map<String, Object> params, @Param("offset") Integer offset,
					   @Param("limit") Integer limit);

	@Delete("delete from sys_logs where createTime <= #{time}")
	int deleteLogs(String time);

	@Select("SELECT * from sys_logs s  LIMIT 1,#{limit}")
	List<SysLogs> listLog(@Param("limit") int limit);
}
