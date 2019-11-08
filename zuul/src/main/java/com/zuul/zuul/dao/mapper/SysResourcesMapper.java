package com.zuul.zuul.dao.mapper;

import com.zuul.zuul.dao.po.SysResources;
import com.zuul.zuul.dao.po.SysResourcesExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SysResourcesMapper {
    int countByExample(SysResourcesExample example);

    int deleteByExample(SysResourcesExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SysResources record);

    int insertSelective(SysResources record);

    List<SysResources> selectByExample(SysResourcesExample example);

    SysResources selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SysResources record, @Param("example") SysResourcesExample example);

    int updateByExample(@Param("record") SysResources record, @Param("example") SysResourcesExample example);

    int updateByPrimaryKeySelective(SysResources record);

    int updateByPrimaryKey(SysResources record);
}