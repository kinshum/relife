package com.bzkj.entity.activity;

import java.io.Serializable;

/**
 * olmp_activity
 * @author 
 */
public class OlmpActivityWithBLOBs extends OlmpActivity implements Serializable {
    /**
     * 活动详情
     */
    private String acDetails;

    /**
     * 活动规则
     */
    private String acRule;

    private static final long serialVersionUID = 1L;

    public String getAcDetails() {
        return acDetails;
    }

    public void setAcDetails(String acDetails) {
        this.acDetails = acDetails;
    }

    public String getAcRule() {
        return acRule;
    }

    public void setAcRule(String acRule) {
        this.acRule = acRule;
    }
}