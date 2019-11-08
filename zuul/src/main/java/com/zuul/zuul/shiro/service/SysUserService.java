package com.zuul.zuul.shiro.service;

import com.zuul.zuul.dao.po.SysUser;
import com.zuul.zuul.dao.po.SysUserExample;
import com.zuul.zuul.shiro.extDao.po.SysUserExt;

import java.util.List;

/**
 * 用户查询
 * @author lenovo
 */
public interface SysUserService {
    /**
     * 根据id查询用户信息
     * @param userId
     * @return
     */
     SysUserExt getByPrimaryKey(String userId);

    /**
     * 更新用户
     * @param user
     */
    void updateUserLastLoginInfo(SysUser user);

    /**
     * 用户查询
     * @param example
     * @return
     */
    List< SysUser> querySysUserList(SysUserExample example);
}
