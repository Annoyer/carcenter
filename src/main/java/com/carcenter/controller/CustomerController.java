package com.carcenter.controller;

import com.carcenter.dto.Result;
import com.carcenter.model.Car;
import com.carcenter.model.Customer;
import com.carcenter.service.CarService;
import com.carcenter.service.CustomerService;
import com.carcenter.service.MessageService;
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

    @Autowired
    CarService carService;

    @Autowired
    MessageService messageService;

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

    @RequestMapping(value = "/logout")
    public ModelAndView logout(HttpSession session){
        ModelAndView mv = new ModelAndView();
        session.setAttribute("customer", null);
        mv.setViewName("index");
        return mv;
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

    @RequestMapping(value = "/my_info")
    public ModelAndView toMyInfo(HttpSession session){
        ModelAndView mv = new ModelAndView();
        Customer customer = (Customer) session.getAttribute("customer");
        mv.setViewName("customer/my_info");
        mv.addObject("customer",customer);
        return mv;
    }

    @RequestMapping(value = "/my_rentin")
    public ModelAndView toMyRentin(HttpSession session){
        ModelAndView mv = new ModelAndView();
        Customer customer = (Customer) session.getAttribute("customer");
        mv.setViewName("customer/my_rentin");
        mv.addObject("orders",customerService.getCarOrdersByCustomer(customer.getId()));
        return mv;
    }

    @RequestMapping(value = "/my_rentout")
    public ModelAndView toMyRentout(HttpSession session){
        ModelAndView mv = new ModelAndView();
        Customer customer = (Customer) session.getAttribute("customer");
        mv.setViewName("customer/my_rentout");
        mv.addObject("orders",customerService.getCarOrdersByOwner(customer.getId()));
        return mv;
    }

    @RequestMapping(value = "/my_parking")
    public ModelAndView toMyParking(HttpSession session){
        ModelAndView mv = new ModelAndView();
        Customer customer = (Customer) session.getAttribute("customer");
        mv.setViewName("customer/my_parking");
        mv.addObject("orders",customerService.getParkingOrdersByCustomer(customer.getId()));
        return mv;
    }

    @RequestMapping(value = "/my_cars_unrent")
    public ModelAndView toMyCarsUnrent(HttpSession session){
        ModelAndView mv = new ModelAndView();
        Customer customer = (Customer) session.getAttribute("customer");
        mv.setViewName("customer/my_cars_unrent");
        mv.addObject("cars",customerService.getAvailableCarsByCustomer(customer.getId()));
        return mv;
    }

    @RequestMapping(value = "/modify_car")
    public ModelAndView toModifyCar(@RequestParam("carId") Integer carId, HttpSession session){
        ModelAndView mv = new ModelAndView();
        Customer customer = (Customer) session.getAttribute("customer");
        Car car = carService.getCarById(carId);
        if (car==null || car.getOwnerId()!=customer.getId() || car.getStatus()!=0){
            mv.setViewName("error");
            mv.addObject("msg","您无法修改这辆车的信息");
        } else {
            mv.setViewName("customer/modify_car");
            mv.addObject("car",car);
        }
        return mv;
    }

    @RequestMapping(value = "/carModify",method = RequestMethod.POST)
    public ModelAndView toModifyCar(Car car, HttpSession session){
        ModelAndView mv = new ModelAndView();
        if (!carService.modifyCar(car)){
            mv.setViewName("error");
            mv.addObject("msg","您无法修改这辆车的信息");
        } else {
            mv.setViewName("customer/my_info");
        }
        return mv;
    }

    @RequestMapping(value = "/customerModify",method = RequestMethod.POST)
    public ModelAndView toModifyCar(Customer customer, HttpSession session){
        ModelAndView mv = new ModelAndView();
        if (!customerService.modifyCustomerInfo(customer)){
            mv.setViewName("error");
            mv.addObject("msg","您无法修改信息");
        } else {
            session.setAttribute("customer",customerService.getCustomerById(customer.getId()));
            mv.setViewName("customer/my_info");
        }
        return mv;
    }

    @RequestMapping(value = "/my_message")
    public ModelAndView toMyMessage(HttpSession session){
        ModelAndView mv = new ModelAndView();
        Customer customer = (Customer) session.getAttribute("customer");
        mv.setViewName("customer/my_message");
        mv.addObject("msgs",messageService.getMsgByToId(customer.getId()));
        return mv;
    }

}
