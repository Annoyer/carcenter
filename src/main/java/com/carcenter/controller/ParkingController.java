package com.carcenter.controller;

import com.carcenter.dto.Result;
import com.carcenter.model.ParkingPlace;
import com.carcenter.service.ParkingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by joy12 on 2017/12/6.
 */
@Controller
@RequestMapping("/parking")
public class ParkingController {
    @Autowired
    ParkingService parkingService;

    @RequestMapping(value = "/list")
    public ModelAndView toParkingList(){
        ModelAndView mv = new ModelAndView("rentpark/park_list");
        mv.addObject("parkingLots", parkingService.getAllParkingLot());

        return mv;
    }

    @RequestMapping(value = "/order")
    public ModelAndView toParkingOrder(@RequestParam("lotId")Integer lot_id){
        ModelAndView mv = new ModelAndView("rentpark/park_order");
        mv.addObject("parkingLot", parkingService.getParkingLotById(lot_id));
        return mv;
    }

    @RequestMapping(value = "/availablePlace")
    @ResponseBody
    public Result getAvailablePlace(@RequestParam("lotId")Integer lot_id,@RequestParam("startDay")String startDay,@RequestParam("length")Integer length,@RequestParam("way")String way){
        Result result = new Result();
        List<ParkingPlace> places = parkingService.getAvailableParkingPlaceByLotAndTime(lot_id,startDay,length,way);
        if (places!=null && places.size()>0){
            result.setSuccess(true);
            result.setData(places);
        } else {
            result.setSuccess(false);
            result.setError("该停车场在此时间段已无空位");
        }

        return result;
    }

    @RequestMapping(value = "/makeParkingOrder")
    public ModelAndView makeRentInOrder(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        Map<String,String[]> map = request.getParameterMap();
        switch (parkingService.makeOrder(map)){
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
