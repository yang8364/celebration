package com.consume.service.impl;

import com.consume.dao.mapper.SRoleMapper;
import com.consume.dao.po.SRole;
import com.consume.dao.po.SRoleExample;
import com.consume.service.SRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 1212
 * @author lenovo
 */
@Component
public class SRoleServiceImpl implements SRoleService {
    @Autowired
    SRoleMapper sRoleMapping;
    @Override
    public List<SRole> selectByExample(SRoleExample example) {
        return sRoleMapping.selectByExample(example);
    }
}
