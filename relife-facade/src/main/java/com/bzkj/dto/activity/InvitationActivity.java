package com.bzkj.dto.activity;


import java.io.Serializable;

public class InvitationActivity implements Serializable{

	private static final long serialVersionUID = 1L;
	
    private String acId;//活动id   
	private String acName; // 活动名称
	private String beginDate; // 开始日期
	private String endDate; // 结束日期
	private String acContent;// 活动规则
	private String acDetails;// 分享设置
	private String acOrgId;// 所属机构ID
	private String creator; // 责任人id
	private String acType; // 活动类型
	private String acModel; // 活动方式
	private int acState; // 活动状态数字(0:生成中 1:已生成2:待审核3:已驳回 4:审核通过 5:已发布 6:已暂停 7:已结束)
	private String eid; // 租户id
    private String piaoster;//活动海报(推广mgm)
	public String getAcId() {
		return acId;
	}
	public void setAcId(String acId) {
		this.acId = acId;
	}
	public String getAcName() {
		return acName;
	}
	public void setAcName(String acName) {
		this.acName = acName;
	}
	public String getBeginDate() {
		return beginDate;
	}
	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getAcContent() {
		return acContent;
	}
	public void setAcContent(String acContent) {
		this.acContent = acContent;
	}
	public String getAcDetails() {
		return acDetails;
	}
	public void setAcDetails(String acDetails) {
		this.acDetails = acDetails;
	}
	public String getAcOrgId() {
		return acOrgId;
	}
	public void setAcOrgId(String acOrgId) {
		this.acOrgId = acOrgId;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getAcType() {
		return acType;
	}
	public void setAcType(String acType) {
		this.acType = acType;
	}
	public String getAcModel() {
		return acModel;
	}
	public void setAcModel(String acModel) {
		this.acModel = acModel;
	}
	public int getAcState() {
		return acState;
	}
	public void setAcState(int acState) {
		this.acState = acState;
	}
	public String getEid() {
		return eid;
	}
	public void setEid(String eid) {
		this.eid = eid;
	}
	public String getPiaoster() {
		return piaoster;
	}
	public void setPiaoster(String piaoster) {
		this.piaoster = piaoster;
	}
	
}
