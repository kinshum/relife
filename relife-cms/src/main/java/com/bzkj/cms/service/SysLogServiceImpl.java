package com.bzkj.cms.service;


import com.alibaba.dubbo.config.annotation.Service;
import com.bzkj.cms.dao.SysLogsDao;
import com.bzkj.entity.SysLogs;
import com.bzkj.entity.user.SysUser;
import com.bzkj.facade.cms.SysLogService;
import com.bzkj.utils.UserUtil;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;

import java.util.Date;
import java.util.List;

@Service(interfaceClass = SysLogService.class)
@org.springframework.stereotype.Service
public class SysLogServiceImpl implements SysLogService {

    private static final Logger log = LoggerFactory.getLogger("cmsLogger");

    @Autowired
    private SysLogsDao sysLogsDao;

    @Override
    public void save(SysLogs sysLogs) {
        SysUser user = UserUtil.getLoginUser();
        if (user == null || user.getId() == null) {
            return;
        }

        sysLogs.setUser(user);
        sysLogsDao.save(sysLogs);
    }

    @Async
    @Override
    public void save(Long userId, String module, Boolean flag, String remark) {
        SysLogs sysLogs = new SysLogs();
        sysLogs.setFlag(flag);
        sysLogs.setModule(module);
        sysLogs.setRemark(remark);

        SysUser user = new SysUser();
        user.setId(userId);
        sysLogs.setUser(user);

        sysLogsDao.save(sysLogs);

    }

    @Override
    public void deleteLogs() {
        Date date = DateUtils.addMonths(new Date(), -3);
        String time = DateFormatUtils.format(date, DateFormatUtils.ISO_8601_EXTENDED_DATE_FORMAT.getPattern());

        int n = sysLogsDao.deleteLogs(time);
        log.info("删除{}之前日志{}条", time, n);
    }

    @Override
    public List<SysLogs> getLogList(int limit) {
        List<SysLogs> sysLogs = sysLogsDao.listLog(limit);
        return sysLogs;
    }
}
