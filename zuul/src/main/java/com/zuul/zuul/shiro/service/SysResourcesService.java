package com.zuul.zuul.shiro.service;

import com.zuul.zuul.dao.po.SysResources;

import java.util.List;

public interface SysResourcesService {
    List<SysResources> listByUserId(String id);
}
