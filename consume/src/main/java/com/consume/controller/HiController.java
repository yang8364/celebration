package com.consume.controller;

import com.consume.dao.po.SRole;
import com.consume.dao.po.SRoleExample;
import com.consume.feignInterface.SchedualServiceHi;
import com.consume.service.SRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author lenovo
 */
@RestController
public class HiController {
    @Autowired
    SchedualServiceHi schedualServiceHi;

    @Autowired
    SRoleService sRoleService;

    /**
     * @param name
     * @return
     */
    @RequestMapping(value = "/hi", method = RequestMethod.GET)
    public String sayHi(@RequestParam String name) {
        return schedualServiceHi.sayHi(name);
    }

    @RequestMapping(value = "/getUser", method = RequestMethod.GET)
    @ResponseBody
    public String getUser(String username) {
        SRoleExample example = new SRoleExample();
        List<SRole> list = sRoleService.selectByExample(example);

        return "success";
    }
}
