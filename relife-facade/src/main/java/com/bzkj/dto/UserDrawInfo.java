package com.bzkj.dto;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户抽奖信息
 * 
 * @author HUNTER
 *
 */
public class UserDrawInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//活动ID
	private String activityId;
	
	//用户ID
	private String userId;
		
	//可用抽奖次数
	private int drawTimes = 0;
	
	//已用抽奖次数
	private int drawUsedTimes = 0;
	
	//抽奖总次数
	private int drawTotalTimes = 0;
	
	//中奖次数
	private int winningTimes = 0;
	
	//中奖明细：key：权益ID，权益中奖次数
	private Map<String, Integer> winningDetails = new HashMap<>();
	
	
	//抽奖次数周期：0不限制；1每日；2每周；3每月；4活动期间
	private int drawPeriod = 0;
	
	private Map<String, Integer> periodDrawTimesMap = new HashMap<>();

	//抽奖次数清理标识：0不清理；1每日清理；2每周清理；3每月清理；
	private int cleanPeriod = 0;
	
	private Map<String, Integer> periodCleanMap = new HashMap<>();
	
	//中奖概率
	private int winningRate = 0;
	
	//中奖次数周期：0不限制；1每日；2每周；3每月；4活动期间
	private int winningPeriod = 0;
	
	private Map<String, Integer> periodWinningTimesMap = new HashMap<>();
	
	//会话内连续未中奖次数：
	private int inSessionNotWinningTimes = 0;

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getDrawTimes() {
		return drawTimes;
	}

	public void setDrawTimes(int drawTimes) {
		this.drawTimes = drawTimes;
	}

	public int getDrawUsedTimes() {
		return drawUsedTimes;
	}

	public void setDrawUsedTimes(int drawUsedTimes) {
		this.drawUsedTimes = drawUsedTimes;
	}

	public int getDrawTotalTimes() {
		return drawTotalTimes;
	}

	public void setDrawTotalTimes(int drawTotalTimes) {
		this.drawTotalTimes = drawTotalTimes;
	}

	public int getWinningTimes() {
		return winningTimes;
	}

	public void setWinningTimes(int winningTimes) {
		this.winningTimes = winningTimes;
	}

	public Map<String, Integer> getWinningDetails() {
		return winningDetails;
	}

	public void setWinningDetails(Map<String, Integer> winningDetails) {
		this.winningDetails = winningDetails;
	}
	
	public int getDrawPeriod() {
		return drawPeriod;
	}

	public void setDrawPeriod(int drawPeriod) {
		this.drawPeriod = drawPeriod;
	}

	public int getCleanPeriod() {
		return cleanPeriod;
	}

	public void setCleanPeriod(int cleanPeriod) {
		this.cleanPeriod = cleanPeriod;
		String cleanPeriodKey = DrawDateUtil.getCleanKeyDate(cleanPeriod, null);
		this.periodCleanMap.put(cleanPeriodKey, 0);
	}

	public int getWinningRate() {
		return winningRate;
	}

	public void setWinningRate(int winningRate) {
		this.winningRate = winningRate;
	}

	public int getWinningPeriod() {
		return winningPeriod;
	}

	public void setWinningPeriod(int winningPeriod) {
		this.winningPeriod = winningPeriod;
	}

	public int getInSessionNotWinningTimes() {
		return inSessionNotWinningTimes;
	}

	public void setInSessionNotWinningTimes(int inSessionNotWinningTimes) {
		this.inSessionNotWinningTimes = inSessionNotWinningTimes;
	}

	public int getPeriodDrawTimes() {
		String drawPeriodKey = DrawDateUtil.getKeyDate(drawPeriod, null);
		return periodDrawTimesMap.get(drawPeriodKey);
	}

	public int getPeriodWinningTimes() {
		String winningPeriodKey = DrawDateUtil.getKeyDate(winningPeriod, null);
		return periodWinningTimesMap.get(winningPeriodKey);
	}

	public Map<String, Integer> getPeriodDrawTimesMap() {
		return periodDrawTimesMap;
	}

	public void setPeriodDrawTimes(int drawPeriod, int drawTimes) {
		String drawPeriodKey = DrawDateUtil.getKeyDate(drawPeriod, null);
		this.periodDrawTimesMap.put(drawPeriodKey, drawTimes);
	}
	
	public void cleanPeriodDrawTimes(int drawPeriod, int drawTimes) {
		String drawPeriodKey = DrawDateUtil.getKeyDate(drawPeriod, null);
		if (!this.periodDrawTimesMap.containsKey(drawPeriodKey)) {
			this.periodDrawTimesMap.clear();
			this.periodDrawTimesMap.put(drawPeriodKey, drawTimes);
		}
	}

	public Map<String, Integer> getPeriodWinningTimesMap() {
		return periodWinningTimesMap;
	}

	public Map<String, Integer> getPeriodCleanMap() {
		return periodCleanMap;
	}
	
	public void setPeriodWinningTimes(int winningPeriod, int winningTimes) {
		String winningPeriodKey = DrawDateUtil.getKeyDate(winningPeriod, null);
		this.periodWinningTimesMap.put(winningPeriodKey, winningTimes);
	}
	
	public void cleanPeriodWinningTimes(int winningPeriod, int winningTimes) {
		String winningPeriodKey = DrawDateUtil.getKeyDate(winningPeriod, null);
		if (!this.periodWinningTimesMap.containsKey(winningPeriodKey)) {
			this.periodWinningTimesMap.clear();
			this.periodWinningTimesMap.put(winningPeriodKey, winningTimes);
		}
	}
	
	public void cleanDrawTimes(int cleanPeriod) {
		String cleanPeriodKey = DrawDateUtil.getCleanKeyDate(cleanPeriod, null);
		if (!this.periodCleanMap.containsKey(cleanPeriodKey)) {
			this.periodCleanMap.clear();
			this.periodCleanMap.put(cleanPeriodKey, 0);
			this.drawTimes = 0;
		}
	}

	public void setPeriodDrawTimesMap(Map<String, Integer> periodDrawTimesMap) {
		this.periodDrawTimesMap = periodDrawTimesMap;
	}

	public void setPeriodCleanMap(Map<String, Integer> periodCleanMap) {
		this.periodCleanMap = periodCleanMap;
	}

	public void setPeriodWinningTimesMap(Map<String, Integer> periodWinningTimesMap) {
		this.periodWinningTimesMap = periodWinningTimesMap;
	}
	
	
}
