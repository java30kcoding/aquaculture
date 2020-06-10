package com.etc.aquaculture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 主页控制器
 *
 * @author yanxq
 * @date 2020/6/10 23:02
 **/
@Controller
public class IndexController {

    @RequestMapping("index")
    public String index(){
        return "index";
    }

    @RequestMapping("/")
    public String all(){
        return "index";
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

}
