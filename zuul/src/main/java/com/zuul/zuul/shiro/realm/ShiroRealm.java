package com.zuul.zuul.shiro.realm;


import com.zuul.zuul.dao.mapper.SysResourcesMapper;
import com.zuul.zuul.dao.po.*;

import com.zuul.zuul.shiro.Enum.UserStatusEnum;
import com.zuul.zuul.shiro.Enum.UserTypeEnum;
import com.zuul.zuul.shiro.service.SysResourcesService;
import com.zuul.zuul.shiro.service.SysRoleService;
import com.zuul.zuul.shiro.service.SysUserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


/**
 * 密码输入错误的状态下重试次数的匹配管理
 *
 * @author lenovo
 */
public class ShiroRealm extends AuthorizingRealm {

    @Resource
    private SysUserService sysUserService;
    @Resource
    private SysRoleService sysRoleService;
    @Resource
    private SysResourcesService sysResourceService;

    @Resource
    private SysResourcesMapper sysResourcesMapper;

    /**
     * 提供账户信息返回认证信息（用户的角色信息集合）doGetAuthorizationInfo
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        //获取用户的输入的账号.
        String username = (String) token.getPrincipal();
        SysUserExample sysUserExample = new SysUserExample();
        sysUserExample.createCriteria().andUsernameEqualTo(username);
        List<SysUser> sysUserList = sysUserService.querySysUserList(sysUserExample);

        if (sysUserList == null || sysUserList.size() == 0) {
            throw new UnknownAccountException("账号不存在！");
        }
        //取查询第一条数据
        SysUser user = sysUserList.get(0);
        if (user.getStatus() != null && UserStatusEnum.DISABLE.getCode().equals(user.getStatus())) {
            throw new LockedAccountException("帐号已被锁定，禁止登录！");
        }

        // principal参数使用用户Id，方便动态刷新用户权限
        return new SimpleAuthenticationInfo(
                user.getId(),
                user.getPassword(),
                ByteSource.Util.bytes(username),
                getName()
        );
    }

    /**
     * 权限认证，为当前登录的Subject授予角色和权限（角色的权限信息集合）
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        // 权限信息对象info,用来存放查出的用户的所有的角色（role）及权限（permission）
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

        String userId = SecurityUtils.getSubject().getPrincipal().toString();

        // 赋予角色
        List<SysRole> roleList = sysRoleService.listRolesByUserId(userId);
        for (SysRole role : roleList) {
            info.addRole(role.getName());
        }

        // 赋予权限
        List<SysResources> resourcesList = null;
        SysUser user = sysUserService.getByPrimaryKey(userId);
        if (null == user) {
            return info;
        }
        // ROOT用户默认拥有所有权限
        if (UserTypeEnum.ROOT.toString().equalsIgnoreCase(user.getUserType())) {
            resourcesList = sysResourcesMapper.selectByExample(new SysResourcesExample());
        } else {
            resourcesList = sysResourceService.listByUserId(userId);
        }

        if (!CollectionUtils.isEmpty(resourcesList)) {
            Set<String> permissionSet = new HashSet<>();
            for (SysResources resources : resourcesList) {
                String permission = null;
                if (!StringUtils.isEmpty(permission = resources.getPermission())) {
                    permissionSet.addAll(Arrays.asList(permission.trim().split(",")));
                }
            }
            info.setStringPermissions(permissionSet);
        }
        return info;
    }

}
