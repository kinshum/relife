package com.bzkj.cms.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.bzkj.entity.user.SysUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface SysUserMapper extends BaseMapper<SysUser> {
    int deleteByPrimaryKey(Long id);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);

    @Select("select * from sys_user su WHERE su.login_name = #{username} AND su.`password` = #{password}")
    SysUser getUserByNameAndPwd(@Param("username") String username, @Param("password") String password);
}