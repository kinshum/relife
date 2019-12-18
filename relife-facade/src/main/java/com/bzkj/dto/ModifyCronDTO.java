package com.bzkj.dto;

import java.io.Serializable;

/**
 * Created by EalenXie on 2019/5/14 10:16.
 */

public class ModifyCronDTO implements Serializable {

    private Integer id;
    private String cron;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCron() {
        return cron;
    }

    public void setCron(String cron) {
        this.cron = cron;
    }
}
