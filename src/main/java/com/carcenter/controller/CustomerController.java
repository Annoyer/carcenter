package com.carcenter.controller;

import com.carcenter.dto.Result;
import com.carcenter.model.Customer;
import com.carcenter.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by joy12 on 2017/12/3.
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    CustomerService customerService;

    @RequestMapping(value = "/register")
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
    @RequestMapping(value = "/clients")
    public ModelAndView toCustomer(){
        ModelAndView mv = new ModelAndView("admin/clients");
        mv.addObject("clients",customerService.getAllCustomers());
        return mv;
    }

    @RequestMapping(value = "/login")
    @ResponseBody
    public Result login(HttpSession session,@RequestParam("phone") String phone, @RequestParam("password") String password){
        Result result = new Result();
        Customer customer = customerService.login(phone,password);
        if (customer!=null){
            session.setAttribute("customer",customer);
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
            result.setError("账号密码错误");
        }
        return result;
    }

    //非ajax请求示例
    @RequestMapping(value = "/listAll")
    public ModelAndView listAllCustomers(){
        ModelAndView mv = new ModelAndView();
        mv.addObject("customersList",customerService.getAllCustomers());
        return mv;
    }

    //ajax请求示例
    @RequestMapping(value = "/findCustomerById",method = RequestMethod.POST)
    @ResponseBody
    public Result findCustomer(@RequestParam("customerId") Integer cid){
        Result result = new Result();

        Customer customer = customerService.getCustomerById(cid);
        if (customer == null){
            result.setSuccess(false);
            result.setError("此用户不存在");
        } else {
            result.setSuccess(true);
            result.setData(customer);
        }

        return result;
    }
}
