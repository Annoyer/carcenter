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




//    @RequestMapping(value = "/release_parking")
//    public String toReleaseparking(){
//        return "admin/release_parking";
//    }
//
//    @RequestMapping(value = "/release_news")
//    public String toRelease(){return "admin/release_news";}
//    @RequestMapping(value = "/article")
//    public String toArticle(){
//        return "admin/article";
//    }
//    @RequestMapping(value = "/car")
//    public String toCar(){
//        return "admin/car";
//    }
//    @RequestMapping(value = "/car_detail")
//    public String toCardetail(){
//        return "admin/car_detail";
//    }
//    @RequestMapping(value = "/check_car")
//    public String toCheckcar(){
//        return "admin/check_car";
//    }
//    @RequestMapping(value = "/check_car_order")
//    public String toCheckcarorder(){
//        return "admin/start_car_order";
//    }
//    @RequestMapping(value = "/check_space_order")
//    public String toCheckspaceorder(){
//        return "admin/start_space_order";
//    }
//    @RequestMapping(value = "/find_car_order")
//    public String toFindcarorder(){
//        return "admin/find_car_order";
//    }
//    @RequestMapping(value = "/find_space_order")
//    public String toFindspaceorder(){
//        return "admin/find_space_order";
//    }
    @RequestMapping(value = "/register")
    public String toRegister(){
        return "register";
    }
}
