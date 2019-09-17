package com.bzkj.dto.finance;

import java.io.Serializable;
import java.math.BigDecimal;

public class WithDrawStatus implements Serializable {

	 /**
	 * 
	 */
	private static final long serialVersionUID = -3071917129237449601L;
	private BigDecimal amonut;
	 private Integer status;
	 private Long lastTime;
	 private String message;
	public BigDecimal getAmonut() {
		return amonut;
	}
	public void setAmonut(BigDecimal amonut) {
		this.amonut = amonut;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Long getLastTime() {
		return lastTime;
	}
	public void setLastTime(Long lastTime) {
		this.lastTime = lastTime;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	 
}
