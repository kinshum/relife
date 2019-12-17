package com.bzkj.facade.cms;

import com.bzkj.entity.Permission;

import java.util.List;

public interface PermissionService {


    List<Permission> listByUserId(Long id);
}
