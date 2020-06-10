package com.etc.aquaculture.controller;

import com.etc.aquaculture.common.R;
import com.etc.aquaculture.dao.UserRepository;
import com.etc.aquaculture.pojo.User;
import com.etc.aquaculture.service.UserService;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 用户前端控制器
 *
 * @author yanxq
 * @date 2020/6/8 16:36
 **/
@Controller
public class UserController {

    @Resource
    UserService userService;

    @RequestMapping(value = "/login.action", method = RequestMethod.POST)
    public String login(User user, Model model, HttpSession session){
        User login = userService.login(user);
        if (login != null) {
            session.setAttribute("USER_LOGIN", login);
            return "redirect:admin.action";
        } else {
            model.addAttribute("msg", "账号或密码错误，请重新输入！");
            return "redirect:login.action";
        }
    }

    @RequestMapping(value = "/logout.action")
    public String logout(HttpSession session) {
        System.out.println("退出！");
        session.invalidate();
        return "redirect:login.action";
    }

    @RequestMapping(value = "login.action", method = RequestMethod.GET)
    public String login(HttpServletRequest request, Model model) {
        String msg = request.getParameter("msg");
        if (msg != null) {
            model.addAttribute("msg", msg);
        }
        return "login";
    }

}
