package com.zuul.zuul.dao.mapper;

import com.zuul.zuul.dao.po.SysRoleResources;
import com.zuul.zuul.dao.po.SysRoleResourcesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysRoleResourcesMapper {
    int countByExample(SysRoleResourcesExample example);

    int deleteByExample(SysRoleResourcesExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SysRoleResources record);

    int insertSelective(SysRoleResources record);

    List<SysRoleResources> selectByExample(SysRoleResourcesExample example);

    SysRoleResources selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SysRoleResources record, @Param("example") SysRoleResourcesExample example);

    int updateByExample(@Param("record") SysRoleResources record, @Param("example") SysRoleResourcesExample example);

    int updateByPrimaryKeySelective(SysRoleResources record);

    int updateByPrimaryKey(SysRoleResources record);
}