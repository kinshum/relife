package com.bzkj.facade.user;import com.baomidou.mybatisplus.service.IService;import com.bzkj.entity.user.SysUser;import com.bzkj.req.LoginReq;/** * @description: * @author: jensen * @date: created by 2019/9/13 3:04 */public interface UserService extends IService<SysUser>{    SysUser getUser(LoginReq loginReq);}