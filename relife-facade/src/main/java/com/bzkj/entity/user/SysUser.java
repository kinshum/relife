package com.bzkj.entity.user;

import java.io.Serializable;

/**
 * sys_user
 * @author 
 */
public class SysUser implements Serializable {
    /**
     * 自增主键
     */
    private Long id;

    /**
     * 客户id
     */
    private String userId;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 创建时间
     */
    private String createTime;

    /**
     * 创建者
     */
    private String creator;

    /**
     * 租户号
     */
    private String eId;

    /**
     * 锁定状态 ，0正常，1锁定
     */
    private Integer locked;

    /**
     * 登录名
     */
    private String loginName;

    /**
     * 用户名称
     */
    private String userName;

    /**
     * 所属机构id
     */
    private String organizationId;

    /**
     * 密码
     */
    private String password;

    /**
     * 手机号
     */
    private String phone;

    /**
     * 微信用户性别
     */
    private String sex;

    /**
     * 状态0失败1成功
     */
    private String status;

    /**
     * 用户类别
     */
    private Integer userType;

    /**
     * 联系人
     */
    private String linkman;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator;
    }

    public String geteId() {
        return eId;
    }

    public void seteId(String eId) {
        this.eId = eId;
    }

    public Integer getLocked() {
        return locked;
    }

    public void setLocked(Integer locked) {
        this.locked = locked;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getOrganizationId() {
        return organizationId;
    }

    public void setOrganizationId(String organizationId) {
        this.organizationId = organizationId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public String getLinkman() {
        return linkman;
    }

    public void setLinkman(String linkman) {
        this.linkman = linkman;
    }
}