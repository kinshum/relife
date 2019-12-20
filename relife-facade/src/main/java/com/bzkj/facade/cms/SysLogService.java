package com.bzkj.facade.cms;

import com.bzkj.entity.SysLogs;
import com.bzkj.rsp.Result;

import java.util.List;

public interface SysLogService {


    void save(SysLogs sysLogs);

    void save(Long userId, String module, Boolean flag, String remark);

    void deleteLogs();

    List<SysLogs> getLogList(int limit);
}
