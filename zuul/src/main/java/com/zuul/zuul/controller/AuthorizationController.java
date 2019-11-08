package com.zuul.zuul.controller;

import com.zuul.zuul.dao.po.SysUser;
import com.zuul.zuul.shiro.consts.SessionConst;
import com.zuul.zuul.shiro.extDao.po.SysUserExt;
import com.zuul.zuul.shiro.object.ResponseVO;
import com.zuul.zuul.shiro.util.ResultUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


/**
 * 登陆，权限控制
 * @author lenovo
 */
@Controller
public class AuthorizationController {
    Logger log = LoggerFactory.getLogger(this.getClass());
    @RequestMapping("/login")
    @ResponseBody
    public ResponseVO login(@RequestParam(name = "username" , required = false)String username, String password){
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(username,password,true);
        Subject subject = SecurityUtils.getSubject();
        try{
            subject.login(usernamePasswordToken);
            return ResultUtil.success("登录成功！");
        }catch (Exception e){
            log.info(" user :" + username + "; 登陆失败！" + e);
            e.printStackTrace();
            usernamePasswordToken.clear();
            return ResultUtil.error(e.getMessage());
        }
    }
    @RequestMapping("/roles")
    @ResponseBody
    public ResponseVO roles(SysUser user){
        log.info("roles 执行");
        Object login = SecurityUtils.getSubject().getPrincipal();
//        log.info("user is " + login.getUsername());
        return ResultUtil.success("获取成功","测试数据");
    }

    @RequestMapping("/test")
    @ResponseBody
    public ResponseVO test(SysUser user){
        log.info("roles 执行");
        Object login = SecurityUtils.getSubject().getPrincipal();
        Object obj = SecurityUtils.getSubject().getSession().getAttribute(SessionConst.USER_SESSION_KEY);
//        log.info("user is " + login.getUsername());
        return ResultUtil.success("获取成功","测试数据");
    }

    @RequestMapping("/logout")
    @ResponseBody
    public ResponseVO logout(RedirectAttributes redirectAttributes) {
        log.info("logout 执行了");
        // http://www.oschina.net/question/99751_91561
        // 此处有坑： 退出登录，其实不用实现任何东西，只需要保留这个接口即可，也不可能通过下方的代码进行退出
        SecurityUtils.getSubject().logout();
        // 因为退出操作是由Shiro控制的
//        redirectAttributes.addFlashAttribute("message", "您已安全退出");
        return ResultUtil.success("退出登陆");
    }
    public static void main(String[] args) {
        SysUser sysUser = new SysUser();
        sysUser.setUsername("aaaa");

        SysUserExt sysUserExt = new SysUserExt();



//        sysUserExt.sysUser = sysUser;
//        sysUserExt = (SysUserExt)sysUser;
        System.out.println(sysUserExt);
    }
}
