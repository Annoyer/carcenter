package com.carcenter.controller;

import com.carcenter.service.CarOrderService;
import com.carcenter.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by joy12 on 2017/12/8.
 */
@Controller
@RequestMapping("/carOrder")
public class CarOrderController {
    @Autowired
    CarService carService;
    @Autowired
    CarOrderService carOrderService;

    @RequestMapping(value = "/rent_in")
    public ModelAndView toRentIn(@RequestParam("carId") Integer carId){
        ModelAndView mv = new ModelAndView("rentcar/car_order_rentin");
        mv.addObject("car",carService.getCarById(carId));
        return mv;
    }

    @RequestMapping(value = "/makeRentInOrder")
    public ModelAndView makeRentInOrder(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        Map<String,String[]> map = request.getParameterMap();
        switch (carOrderService.makeOrder(map)){
            case -1:
            mv.setViewName("error");
            mv.addObject("msg","订单信息错误，请重新填写");
            break;
            case 1:
            mv.setViewName("error");
            mv.addObject("msg","很抱歉，该时间段已有预约了");
            break;
            case 0:
            mv.setViewName("success");
            mv.addObject("msg","订单创建成功！");
            break;
            default:
            mv.setViewName("error");
            mv.addObject("msg","未知错误");
            break;
        }
        return mv;
    }
}
