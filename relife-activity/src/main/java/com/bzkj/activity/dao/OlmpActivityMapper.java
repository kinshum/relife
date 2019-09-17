package com.bzkj.activity.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.bzkj.entity.activity.OlmpActivityWithBLOBs;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;


public interface OlmpActivityMapper extends BaseMapper<OlmpActivityWithBLOBs> {



    @Select("SELECT oa.* from olmp_activity oa WHERE oa.ac_id = #{acId} AND oa.delete_flag = 0 ")
    OlmpActivityWithBLOBs findAcId(@Param("acId") String activityId);

}