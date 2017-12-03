package com.carcenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by joy12 on 2017/12/3.
 */
@Controller
public class SimplePageController {

    @RequestMapping(value = "/login")
    public String toLogin(){
        return "login";
    }

    @RequestMapping(value = "/admin_login")
    public String toAdminLogin(){
        return "admin_login";
    }

    @RequestMapping(value = "/register")
    public String toRegister(){
        return "register";
    }
}
