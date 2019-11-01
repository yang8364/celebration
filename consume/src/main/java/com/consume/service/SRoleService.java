package com.consume.service;

import com.consume.dao.po.SRole;
import com.consume.dao.po.SRoleExample;

import java.util.List;

public interface SRoleService {

    List<SRole> selectByExample(SRoleExample example);
}
