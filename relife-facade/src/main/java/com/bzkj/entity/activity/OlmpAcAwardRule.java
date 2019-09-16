package com.bzkj.entity.activity;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * olmp_ac_award_rule
 * @author 
 */
public class OlmpAcAwardRule implements Serializable {
    /**
     * 自增主键
     */
    private Long id;

    /**
     * 活动ID
     */
    private String acId;

    /**
     * 抽奖次数是否限制 0不限制；1限制
     */
    private Byte isAwardNumLimit;

    /**
     * 抽奖周期类型（0不限制时默认无、1每日、2每周、3每月、4活动期间）
     */
    private Byte awardCycleType;

    /**
     * 周期内可抽奖次数
     */
    private Integer cycleAwardNum;

    /**
     * 抽奖次数计算规则：0不启用、1每日清零、2每周清零、3每月清零、4累计
     */
    private Byte awardNumRule;

    /**
     * 中奖概率
     */
    private BigDecimal prizeRate;

    /**
     * 中奖次数是否限制 0不限制；1限制
     */
    private Byte isPrizeNumLimit;

    /**
     * 中奖周期类型（0不限制时默认无、1每日、2每周、3每月、4活动期间）
     */
    private Byte prizeCycleType;

    /**
     * 周期内可中奖次数
     */
    private Byte cyclePrizeNum;

    /**
     * 中奖规则设置：0无规则、第X次必中多个使用英文逗号隔开,例如第1次和第10次必中则填：1,10
     */
    private String prizeRule;

    /**
     * 创建时间
     */
    private String createTime;

    /**
     * 创建者
     */
    private String creator;

    /**
     * 修改时间
     */
    private String updateTime;

    /**
     * 修改人
     */
    private String updateUser;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAcId() {
        return acId;
    }

    public void setAcId(String acId) {
        this.acId = acId;
    }

    public Byte getIsAwardNumLimit() {
        return isAwardNumLimit;
    }

    public void setIsAwardNumLimit(Byte isAwardNumLimit) {
        this.isAwardNumLimit = isAwardNumLimit;
    }

    public Byte getAwardCycleType() {
        return awardCycleType;
    }

    public void setAwardCycleType(Byte awardCycleType) {
        this.awardCycleType = awardCycleType;
    }

    public Integer getCycleAwardNum() {
        return cycleAwardNum;
    }

    public void setCycleAwardNum(Integer cycleAwardNum) {
        this.cycleAwardNum = cycleAwardNum;
    }

    public Byte getAwardNumRule() {
        return awardNumRule;
    }

    public void setAwardNumRule(Byte awardNumRule) {
        this.awardNumRule = awardNumRule;
    }

    public BigDecimal getPrizeRate() {
        return prizeRate;
    }

    public void setPrizeRate(BigDecimal prizeRate) {
        this.prizeRate = prizeRate;
    }

    public Byte getIsPrizeNumLimit() {
        return isPrizeNumLimit;
    }

    public void setIsPrizeNumLimit(Byte isPrizeNumLimit) {
        this.isPrizeNumLimit = isPrizeNumLimit;
    }

    public Byte getPrizeCycleType() {
        return prizeCycleType;
    }

    public void setPrizeCycleType(Byte prizeCycleType) {
        this.prizeCycleType = prizeCycleType;
    }

    public Byte getCyclePrizeNum() {
        return cyclePrizeNum;
    }

    public void setCyclePrizeNum(Byte cyclePrizeNum) {
        this.cyclePrizeNum = cyclePrizeNum;
    }

    public String getPrizeRule() {
        return prizeRule;
    }

    public void setPrizeRule(String prizeRule) {
        this.prizeRule = prizeRule;
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

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser;
    }
}