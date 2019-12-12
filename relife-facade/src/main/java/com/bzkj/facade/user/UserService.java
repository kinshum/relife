package com.bzkj.facade.user;

import com.bzkj.dto.UserDto;
import com.bzkj.entity.user.SysUser;

import java.util.Set;

public interface UserService {

    SysUser saveUser(UserDto userDto);

    SysUser updateUser(UserDto userDto);

    SysUser getUser(String username);

    void changePassword(String username, String oldPassword, String newPassword);

    void updateLoginUserCache(Set<Long> userIds);

}
