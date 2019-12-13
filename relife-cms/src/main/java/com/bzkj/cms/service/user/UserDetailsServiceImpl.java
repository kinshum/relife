package com.bzkj.cms.service.user;

import com.alibaba.dubbo.config.annotation.Service;
import com.bzkj.cms.dao.PermissionDao;
import com.bzkj.dto.LoginUser;
import com.bzkj.entity.Permission;
import com.bzkj.entity.user.SysUser;
import com.bzkj.facade.user.UserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.List;

@Service(group = "userDetailsServiceImpl")
@Component
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserService userService;
    @Autowired
    private PermissionDao permissionDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        SysUser sysUser = userService.getUser(username);
        if (sysUser == null) {
            throw new AuthenticationCredentialsNotFoundException("用户名不存在");
        } else if (sysUser.getStatus() == SysUser.Status.LOCKED) {
            throw new LockedException("用户被锁定,请联系管理员");
        } else if (sysUser.getStatus() == SysUser.Status.DISABLED) {
            throw new DisabledException("用户已作废");
        }

        LoginUser loginUser = new LoginUser();
        BeanUtils.copyProperties(sysUser, loginUser);

        List<Permission> permissions = permissionDao.listByUserId(sysUser.getId());
        loginUser.setPermissions(permissions);

        return loginUser;
    }

}

