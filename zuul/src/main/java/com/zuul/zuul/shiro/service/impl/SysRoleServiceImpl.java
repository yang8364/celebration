package com.zuul.zuul.shiro.service.impl;

import com.zuul.zuul.dao.mapper.SysRoleMapper;
import com.zuul.zuul.dao.po.SysRole;
import com.zuul.zuul.dao.po.SysRoleExample;
import com.zuul.zuul.shiro.service.SysRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysRoleServiceImpl implements SysRoleService {

    @Autowired
    SysRoleMapper sysRoleMapper;
    @Override
    public List<SysRole> listRolesByUserId(String userId)  {
        SysRoleExample example = new SysRoleExample();
        List< SysRole> sysRoleList = sysRoleMapper.selectByExample(example);
        if(sysRoleList != null && sysRoleList.size() > 0){
            return sysRoleList;
        }
        return null;
    }
}
