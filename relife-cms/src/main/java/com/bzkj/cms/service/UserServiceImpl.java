package com.bzkj.cms.service;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.dubbo.config.annotation.Service;
import com.bzkj.cms.dao.PermissionDao;
import com.bzkj.cms.dao.UserDao;
import com.bzkj.dto.LoginUser;
import com.bzkj.dto.UserDto;
import com.bzkj.entity.Permission;
import com.bzkj.entity.user.SysUser;

import com.bzkj.facade.cms.UserService;
import com.bzkj.facade.security.TokenService;
import com.google.common.collect.Sets;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Set;

/**
 * @description:
 * @author: jensen
 * @date: created by 2019/9/13 3:04
 */
@Service(interfaceClass = UserService.class)
@org.springframework.stereotype.Service
public class UserServiceImpl implements UserService{

    private static final Logger logger = LoggerFactory.getLogger("cmsLogger");

    @Autowired
    private UserDao userDao;
    @Autowired
    private PermissionDao permissionDao;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private TokenService tokenService;

    @Override
    @Transactional
    public SysUser saveUser(UserDto userDto) {
        SysUser user = userDto;
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setStatus(SysUser.Status.VALID);
        userDao.save(user);
        saveUserRoles(user.getId(), userDto.getRoleIds());
        logger.debug("新增用户{}", user.getUsername());
        return user;
    }

    private void saveUserRoles(Long userId, List<Long> roleIds) {
        if (roleIds != null) {
            userDao.deleteUserRole(userId);
            if (!CollectionUtils.isEmpty(roleIds)) {
                userDao.saveUserRoles(userId, roleIds);
            }
        }
    }

    @Override
    public SysUser getUser(String username) {
        return userDao.getUser(username);
    }

    @Override
    public void changePassword(String username, String oldPassword, String newPassword) {
        SysUser u = userDao.getUser(username);
        if (u == null) {
            throw new IllegalArgumentException("用户不存在");
        }

        if (!passwordEncoder.matches(oldPassword, u.getPassword())) {
            throw new IllegalArgumentException("旧密码错误");
        }

        userDao.changePassword(u.getId(), passwordEncoder.encode(newPassword));

        logger.debug("修改{}的密码", username);
    }

    @Override
    @Transactional
    public SysUser updateUser(UserDto userDto) {
        userDao.update(userDto);
        saveUserRoles(userDto.getId(), userDto.getRoleIds());
        updateLoginUserCache(Sets.newHashSet(userDto.getId()));

        return userDto;
    }

    /**
     * 修改登陆用户的缓存
     */
    @Override
    public void updateLoginUserCache(Set<Long> userIds) {
        if (CollectionUtils.isEmpty(userIds)) {
            return;
        }

        userIds.parallelStream().forEach(userId -> {
            String token = tokenService.getTokenByUserId(userId);
            if (!StringUtils.isEmpty(token)) {
                SysUser sysUser = userDao.getById(userId);

                LoginUser loginUser = new LoginUser();
                loginUser.setToken(token);
                BeanUtils.copyProperties(sysUser, loginUser);

                List<Permission> permissions = permissionDao.listByUserId(sysUser.getId());
                loginUser.setPermissions(permissions);
                tokenService.updateLoginUser(loginUser);
            }
        });
    }
}
