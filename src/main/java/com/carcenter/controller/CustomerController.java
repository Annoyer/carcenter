package com.carcenter.controller;

import com.carcenter.dto.Result;
import com.carcenter.model.Customer;
import com.carcenter.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by joy12 on 2017/12/3.
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    CustomerService customerService;

    //非ajax请求示例
    @RequestMapping(value = "/listAll")
    public ModelAndView listAllCustomers(){
        ModelAndView mv = new ModelAndView("test");
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
