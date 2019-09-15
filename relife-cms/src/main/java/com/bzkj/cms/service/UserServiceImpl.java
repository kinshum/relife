package com.bzkj.cms.service;import com.alibaba.dubbo.common.utils.StringUtils;import com.alibaba.dubbo.config.annotation.Service;import com.baomidou.mybatisplus.service.impl.ServiceImpl;import com.bzkj.cms.dao.SysUserMapper;import com.bzkj.entity.user.SysUser;import com.bzkj.exception.CommonBizException;import com.bzkj.exception.ExpCodeEnum;import com.bzkj.facade.user.UserService;import com.bzkj.req.LoginReq;import com.bzkj.utils.PasswordUtil;import org.springframework.beans.factory.annotation.Autowired;/** * @description: * @author: jensen * @date: created by 2019/9/13 3:04 */@Service(interfaceClass = UserService.class,version = "1.0.0")@org.springframework.stereotype.Servicepublic class UserServiceImpl extends ServiceImpl<SysUserMapper, SysUser> implements UserService{    @Autowired    SysUserMapper sysUserDAO;    @Override    public SysUser getUser(LoginReq loginReq) {        this.checkParam(loginReq);        SysUser reqUser = new SysUser();        reqUser.setLoginName(loginReq.getUsername());        reqUser.setPassword(PasswordUtil.getPassword(loginReq.getPassword()));        SysUser sysUser = sysUserDAO.selectOne(reqUser);        if (null == sysUser) {            throw new CommonBizException(ExpCodeEnum.USER_NULL);        }        else if (sysUser.getLocked() == 1) {            throw new CommonBizException(ExpCodeEnum.USER_LOCK);        }        return sysUser;    }    /**     * 参数校验     *     * @param loginReq     */    private void checkParam(LoginReq loginReq) {        // 密码不能为空        if (StringUtils.isEmpty(loginReq.getPassword())) {            throw new CommonBizException(ExpCodeEnum.PASSWD_NULL);        }        // 手机、mail、用户名 至少填一个        if (StringUtils.isEmpty(loginReq.getUsername()) &&                StringUtils.isEmpty(loginReq.getMail()) &&                StringUtils.isEmpty(loginReq.getPhone())) {            throw new CommonBizException(ExpCodeEnum.AUTH_NULL);        }    }}