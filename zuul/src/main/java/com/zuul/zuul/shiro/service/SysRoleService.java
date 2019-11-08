package com.zuul.zuul.shiro.service;

import com.zuul.zuul.dao.po.SysRole;

import java.util.List;

public interface SysRoleService {
    /**
     * 根据用户id 查询角色
     * @param userId
     * @return
     */
    List<SysRole> listRolesByUserId(String userId) ;
}
