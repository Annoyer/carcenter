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
        return "admin/admin_login";
    }
    @RequestMapping(value = "/index1")
    public String toAdminIndex(){
        return "admin/index1";
    }

    @RequestMapping(value = "/add_user")
    public String toAddUser(){
        return "admin/add_user";
    }
    @RequestMapping(value = "/release_news")
    public String toRelease(){
        return "admin/release_news";
    }
    @RequestMapping(value = "/article")
    public String toArticle(){
        return "admin/article";
    }
    @RequestMapping(value = "/car")
    public String toCar(){
        return "admin/car";
    }
    @RequestMapping(value = "/car_detail")
    public String toCardetail(){
        return "admin/car_detail";
    }
    @RequestMapping(value = "/check_car")
    public String toCheckcar(){
        return "admin/check_car";
    }
    @RequestMapping(value = "/check_car_order")
    public String toCheckcarorder(){
        return "admin/check_car_order";
    }
    @RequestMapping(value = "/check_parking")
    public String toCheck_parking(){
        return "admin/check_parking";
    }
    @RequestMapping(value = "/check_space_order")
    public String toCheckspaceorder(){
        return "admin/check_space_order";
    }
    @RequestMapping(value = "/find_car_order")
    public String toFindcarorder(){
        return "admin/find_car_order";
    }
    @RequestMapping(value = "/find_space_order")
    public String toFindspaceorder(){
        return "admin/find_space_order";
    }
    @RequestMapping(value = "/index_v1")
    public String toIndexv1(){
        return "admin/index_v1";
    }
    @RequestMapping(value = "/register")
    public String toRegister(){
        return "register";
    }
}
