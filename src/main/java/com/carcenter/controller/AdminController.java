package com.carcenter.controller;

import com.carcenter.dto.Result;
import com.carcenter.model.Admin;
import com.carcenter.model.Customer;
import com.carcenter.model.News;
import com.carcenter.service.*;
import com.carcenter.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by joy12 on 2017/12/3.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminService adminService;

    @Autowired
    CustomerService customerService;

    @Autowired
    ParkingService parkingService;

    @Autowired
    MessageService messageService;
    @Autowired
    NewsService newsService;
    @Autowired
    CarOrderService CarOrderService;

    @Autowired
    CarService carService;

    @Autowired
    ParkingOrderService parkingOrderService;

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
    @RequestMapping(value = "/clients")
    public ModelAndView toCustomer(){
        ModelAndView mv = new ModelAndView("admin/clients");
        mv.addObject("clients",customerService.getAllCustomers());
        return mv;
    }
    @RequestMapping(value = "/parking_space")
    public ModelAndView toParkingspace(){
        ModelAndView mv = new ModelAndView("admin/parking_space");
        mv.addObject("parkspace",parkingService.getAllParkingSpace());
        return mv;
    }
    @RequestMapping(value = "/add_user")
    @ResponseBody
    public Result register(@ModelAttribute Customer customer){
        Result result = new Result();
        if (customerService.register(customer)){
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
            result.setError("手机号已被注册");
        }
        return result;
    }
    @RequestMapping(value = "/mailbox")
    public ModelAndView toMessage(){
        ModelAndView mv = new ModelAndView("admin/mailbox");
        mv.addObject("message",messageService.selectAllMessage());
        return mv;
    }

    @RequestMapping(value = "/release_news")
    @ResponseBody
    public Result register(@ModelAttribute News news){
        Result result = new Result();
        if (newsService.release(news)){
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
            result.setError("此标题已被占用");
        }
        return result;
    }
    @RequestMapping(value = "/query_news")
    public ModelAndView toQuerynews(){
        ModelAndView mv = new ModelAndView("admin/query_news");
        mv.addObject("news",newsService.getAllNews());
        return mv;
    }
    @RequestMapping(value = "/find_car_order")
    public ModelAndView toFindcarorder(){
        ModelAndView mv = new ModelAndView("admin/find_car_order");
        mv.addObject("carorder", CarOrderService.getAllcarorder());
        return mv;
    }
    @RequestMapping(value = "/find_space_order")
    public ModelAndView toFindparkingorder(){
        ModelAndView mv = new ModelAndView("admin/find_space_order");
        mv.addObject("parkingorder", parkingOrderService.getAllparkingorder());
        return mv;
    }
    @RequestMapping(value = "/car")
    public ModelAndView toFindcar(){
        ModelAndView mv = new ModelAndView("admin/car");
        mv.addObject("car", carService.getAllCars());
        return mv;
    }
    @RequestMapping(value = "/check_car")
    public ModelAndView toFindcarcheck(){
        ModelAndView mv = new ModelAndView("admin/check_car");
        mv.addObject("car", carService.getCarsNeedCheck());
        return mv;
    }
    @RequestMapping(value = "/check_space_order")
    public ModelAndView toCheckspaceorder(){
        ModelAndView mv = new ModelAndView("admin/check_space_order");
        mv.addObject("spaceneedcheck", parkingOrderService.getAllspacecheck());
        return mv;
    }

}
