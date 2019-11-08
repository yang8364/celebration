package com.zuul.zuul.shiro.service.impl;

import com.zuul.zuul.dao.mapper.SysResourcesMapper;
import com.zuul.zuul.dao.po.SysResources;
import com.zuul.zuul.dao.po.SysResourcesExample;
import com.zuul.zuul.dao.po.SysUser;
import com.zuul.zuul.shiro.service.ShiroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
@Service
public class ShiroServiceImpl implements ShiroService {
    @Autowired
    private SysResourcesMapper sysResourcesMapper;

    @Override
    public Map<String, String> loadFilterChainDefinitions() {
        /*
            配置访问权限
            - anon:所有url都都可以匿名访问
            - authc: 需要认证才能进行访问（此处指所有非匿名的路径都需要登陆才能访问）
            - user:配置记住我或认证通过可以访问
         */
        Map<String, String> filterChainDefinitionMap = new LinkedHashMap<String, String>();
        // 配置退出过滤器,其中的具体的退出代码Shiro已经替我们实现了
        filterChainDefinitionMap.put("/logout", "anon");
        filterChainDefinitionMap.put("/login", "anon");
        filterChainDefinitionMap.put("/favicon.ico", "anon");
        filterChainDefinitionMap.put("/error", "anon");
        filterChainDefinitionMap.put("/assets/**", "anon");

        // 加载数据库中配置的资源权限列表
        SysResourcesExample example = new SysResourcesExample();
        example.createCriteria().andUrlIsNotNull();
        List<SysResources> sysResourcesList = sysResourcesMapper.selectByExample(example);
        for (SysResources resources : sysResourcesList) {
            if (!StringUtils.isEmpty(resources.getUrl()) && !StringUtils.isEmpty(resources.getPermission())) {
                String permission = "perms[" + resources.getPermission() + "]";
                filterChainDefinitionMap.put(resources.getUrl(), permission);
            }
        }
        // 本例子中并不存在什么特别关键的操作，所以直接使用user认证。如果有朋友是参考本例子的shiro开发其他安全功能（比如支付等）时，建议针对这类操作使用authc权限 by yadong.zhang
        filterChainDefinitionMap.put("/**", "user");
        return filterChainDefinitionMap;
    }

    @Override
    public void updatePermission() {

    }

    @Override
    public void reloadAuthorizingByUserId(SysUser user) {

    }

    @Override
    public void reloadAuthorizingByRoleId(Long roleId) {

    }
}
