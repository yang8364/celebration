package com.zuul.zuul.shiro.service.impl;

import com.zuul.zuul.dao.po.SysResources;
import com.zuul.zuul.shiro.extDao.mapper.SysResourcesExtMapper;
import com.zuul.zuul.shiro.service.SysResourcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/**
 * 权限资源查询
 * @author lenovo
 */
@Service
public class SysResourcesServiceImpl implements SysResourcesService {
    @Autowired
    private SysResourcesExtMapper sysResourcesExtMapper;
    @Override
    public List<SysResources> listByUserId(String id) {
        return sysResourcesExtMapper.selectResourceByUserId(id);
    }
}
