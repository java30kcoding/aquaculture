package com.etc.aquaculture.controller;

import com.etc.aquaculture.service.WarningService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * 预警控制器
 *
 * @author yuanyl
 * @date 2020/6/9 21:53
 **/
public class WarningController {

    @Resource
    WarningService warningService;

    @RequestMapping(value = "/getWarning.action")
    public String getWarning(Model model) {
        model.addAttribute("warning", warningService.getOne());
        return "OK";
    }

}
