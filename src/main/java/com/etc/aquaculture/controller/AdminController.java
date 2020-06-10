package com.etc.aquaculture.controller;

import com.etc.aquaculture.service.PoolService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * @author yanxq
 * @date 2020/6/8 22:34
 **/
@Controller
public class AdminController {

    @Resource
    PoolService poolService;

    @RequestMapping("/admin.action")
    public String admin(Model model){
        model.addAttribute("poolCount", poolService.getPoolCount());
        return "admin";
    }

}
