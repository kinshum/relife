package com.bzkj.facade.syslog;

import com.bzkj.entity.SysLogs;

public interface SysLogService {


    void save(SysLogs sysLogs);

    void save(Long userId, String module, Boolean flag, String remark);

    void deleteLogs();


}
