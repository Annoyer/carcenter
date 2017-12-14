package com.carcenter.controller;

import com.carcenter.dto.Result;
import com.carcenter.model.CarComment;
import com.carcenter.service.CarOrderService;
import com.carcenter.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

    @RequestMapping(value = "/dealByOwner")
    @ResponseBody
    public Result deal(@RequestParam("orderId") int orderId,@RequestParam("isAccept") boolean isAccept){
        Result result = new Result();
        if (carOrderService.dealOrderByCarOwner(orderId,isAccept)){
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
            result.setError("操作失败");
        }

        return result;
    }

    @RequestMapping(value = "/cancel")
    @ResponseBody
    public Result cancel(@RequestParam("orderId") int orderId){
        Result result = new Result();
        if (carOrderService.cancelOrderByCustomer(orderId)){
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
            result.setError("操作失败");
        }

        return result;
    }

    @RequestMapping(value = "/comment_page")
    public ModelAndView toComment(@RequestParam("carOrderId") int carOrderId){
        ModelAndView mv = new ModelAndView("customer/comment_page");
        mv.addObject("carOrderId",carOrderId);
        return mv;
    }

    @RequestMapping(value = "/comment")
    public ModelAndView comment(CarComment comment){
        ModelAndView mv = new ModelAndView();
        if (carOrderService.makeComment(comment)){
            mv.setViewName("index");
        } else {
            mv.setViewName("error");
            mv.addObject("msg","评价失败");
        }
        return mv;
    }
}
