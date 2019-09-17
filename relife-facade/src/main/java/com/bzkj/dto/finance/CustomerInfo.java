package com.bzkj.dto.finance;

import java.io.Serializable;

public class CustomerInfo implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 6875399904372520313L;
	
	private String avatarUrl;
	private String phone;
	private String nickName;
	private String chName;
	private String enName;
	private String customerId;
	private String channelType;
	private String newRegisterUser;
	private String wsId;
	public String getAvatarUrl() {
		return avatarUrl;
	}
	public void setAvatarUrl(String avatarUrl) {
		this.avatarUrl = avatarUrl;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getChName() {
		return chName;
	}
	public void setChName(String chName) {
		this.chName = chName;
	}
	public String getEnName() {
		return enName;
	}
	public void setEnName(String enName) {
		this.enName = enName;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getChannelType() {
		return channelType;
	}
	public void setChannelType(String channelType) {
		this.channelType = channelType;
	}
	public String getNewRegisterUser() {
		return newRegisterUser;
	}
	public void setNewRegisterUser(String newRegisterUser) {
		this.newRegisterUser = newRegisterUser;
	}
	public String getWsId() {
		return wsId;
	}
	public void setWsId(String wsId) {
		this.wsId = wsId;
	}
	
	
	
}
