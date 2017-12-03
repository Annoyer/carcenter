package com.carcenter.controller;

import com.carcenter.dto.Result;
import com.carcenter.model.Admin;
import com.carcenter.model.Customer;
import com.carcenter.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by joy12 on 2017/12/3.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminService adminService;

    @RequestMapping(value = "/login")
    @ResponseBody
    public Result login(HttpSession session, @RequestParam("name") String name, @RequestParam("password") String password){
        Result result = new Result();
        Admin admin = adminService.adminLogin(name,password);
        if (admin!=null){
            session.setAttribute("admin",admin);
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
            result.setError("账号密码错误");
        }
        return result;
    }
}
