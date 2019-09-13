package com.bzkj.entity.user;

import java.io.Serializable;

/**
 * sys_resource
 * @author 
 */
public class SysResource implements Serializable {
    /**
     * 自增主键
     */
    private Long id;

    /**
     * 资源id
     */
    private String resId;

    /**
     * 组件名
     */
    private String component;

    /**
     * 创建时间
     */
    private String createTime;

    /**
     * 描述信息
     */
    private String description;

    /**
     * 图标样式
     */
    private String icons;

    /**
     * 资源名称
     */
    private String resName;

    /**
     * 路径
     */
    private String path;

    /**
     * 父级资源id
     */
    private String pid;

    /**
     * 排序
     */
    private Integer seq;

    /**
     * 状态0失败1成功
     */
    private String status;

    /**
     * 字段类型
     */
    private String resType;

    /**
     * 宽度
     */
    private Integer width;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getResId() {
        return resId;
    }

    public void setResId(String resId) {
        this.resId = resId;
    }

    public String getComponent() {
        return component;
    }

    public void setComponent(String component) {
        this.component = component;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getIcons() {
        return icons;
    }

    public void setIcons(String icons) {
        this.icons = icons;
    }

    public String getResName() {
        return resName;
    }

    public void setResName(String resName) {
        this.resName = resName;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getResType() {
        return resType;
    }

    public void setResType(String resType) {
        this.resType = resType;
    }

    public Integer getWidth() {
        return width;
    }

    public void setWidth(Integer width) {
        this.width = width;
    }
}