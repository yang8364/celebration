package com.zuul.zuul.shiro.extDao.mapper;

import com.zuul.zuul.dao.po.SysResources;
import com.zuul.zuul.dao.po.SysResourcesExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysResourcesExtMapper {
    List<SysResources> selectResourceByUserId(String id);
}