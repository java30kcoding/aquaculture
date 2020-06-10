package com.etc.aquaculture.controller;

import com.etc.aquaculture.pojo.JsonResult;
import com.etc.aquaculture.pojo.Warning;
import com.etc.aquaculture.service.WarningService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;


/**
 * 预警控制器
 *
 * @author yanxq
 * @date 2020/6/9 21:53
 **/
@Controller
public class WarningController {

    @Resource
    WarningService warningService;

    @RequestMapping(value = "/getWarning.action")
    @ResponseBody
    public JsonResult getWarning(Model model) {
//        model.addAttribute("warning", warningService.getOne());

//        return new JsonResult(new Warnings("ss"));
        return new JsonResult(warningService.getOne());
    }

    @RequestMapping("/updateWarning.action")
    @ResponseBody
    public String updateWarning(Warning warning) {
        warningService.updateWarning(warning);
        return "OK";
    }

    @RequestMapping("/test")
    public void test(){
        warningService.warningByCorn();
    }

}
