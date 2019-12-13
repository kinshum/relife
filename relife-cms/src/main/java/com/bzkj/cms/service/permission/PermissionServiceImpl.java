package com.bzkj.cms.service.permission;

import com.alibaba.dubbo.config.annotation.Service;
import com.bzkj.cms.dao.PermissionDao;
import com.bzkj.entity.Permission;
import com.bzkj.facade.permission.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@org.springframework.stereotype.Service
@Service(version = "1.0.0",interfaceClass = PermissionService.class)
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionDao permissionDao;

    @Override
    public List<Permission> listByUserId(Long id) {
        List<Permission> permissions = permissionDao.listByUserId(id);
        return permissions;
    }
}
