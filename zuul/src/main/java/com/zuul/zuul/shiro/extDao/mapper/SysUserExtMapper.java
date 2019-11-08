package com.zuul.zuul.shiro.extDao.mapper;


import com.zuul.zuul.shiro.extDao.po.SysUserExt;


/**
 * @author lenovo
 */
public interface SysUserExtMapper {

    /**
     * 根据id查询用户
     * @param id
     * @return
     */
    SysUserExt selectSysUserByPrimaryKey(String id);
}