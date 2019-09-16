package com.bzkj.dto.activity;

import java.io.Serializable;
import java.math.BigDecimal;

public class InvitationIncomeRankVo implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String mobile;//手机号
	
	private String activityId;//活动ID
	
	private BigDecimal totalIncome = BigDecimal.valueOf(0.00);//总收益
	private String totalIncomeStr = "0.00";//总收益

	private Integer totalUserCnt = 0;//总人数
	
	private String modified;//更新时间

	private String prizeName; //奖品名称

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public BigDecimal getTotalIncome() {
		return totalIncome;
	}

	public void setTotalIncome(BigDecimal totalIncome) {
		this.totalIncome = totalIncome;
	}

	public String getTotalIncomeStr() {
		return totalIncomeStr;
	}

	public void setTotalIncomeStr(String totalIncomeStr) {
		this.totalIncomeStr = totalIncomeStr;
	}

	public Integer getTotalUserCnt() {
		return totalUserCnt;
	}

	public void setTotalUserCnt(Integer totalUserCnt) {
		this.totalUserCnt = totalUserCnt;
	}

	public String getModified() {
		return modified;
	}

	public void setModified(String modified) {
		this.modified = modified;
	}

	public String getPrizeName() {
		return prizeName;
	}

	public void setPrizeName(String prizeName) {
		this.prizeName = prizeName;
	}
}
