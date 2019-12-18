package com.bzkj.schedule.dao;

import com.alibaba.dubbo.config.annotation.Service;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.bzkj.entity.JobEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;


@Mapper
public interface JobDao extends BaseMapper<JobEntity> {


    @Select("SELECT * FROM job_entity")
    List<JobEntity> findAll();
}
