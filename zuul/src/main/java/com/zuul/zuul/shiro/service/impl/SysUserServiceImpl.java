package com.zuul.zuul.shiro.service.impl;

import com.zuul.zuul.dao.mapper.SysUserMapper;
import com.zuul.zuul.dao.po.SysUser;
import com.zuul.zuul.dao.po.SysUserExample;
import com.zuul.zuul.shiro.extDao.mapper.SysUserExtMapper;
import com.zuul.zuul.shiro.extDao.po.SysUserExt;
import com.zuul.zuul.shiro.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysUserServiceImpl implements SysUserService {
    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysUserExtMapper sysUserExtMapper;
    @Override
    public SysUserExt getByPrimaryKey(String userId) {
        SysUserExt sysUser = sysUserExtMapper.selectSysUserByPrimaryKey(userId);
        return sysUser;
    }

    @Override
    public void updateUserLastLoginInfo(SysUser user) {
        sysUserMapper.updateByPrimaryKey(user);
    }

    @Override
    public List<SysUser> querySysUserList(SysUserExample example) {
        return sysUserMapper.selectByExample(example);
    }
}
