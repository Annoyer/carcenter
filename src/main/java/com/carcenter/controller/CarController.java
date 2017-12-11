package com.carcenter.controller;

import com.carcenter.dto.Result;
import com.carcenter.model.Car;
import com.carcenter.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by joy12 on 2017/12/6.
 */
@Controller()
@RequestMapping("/car")
public class CarController {
    @Autowired
    CarService carService;

    @RequestMapping(value = "/list")
    public ModelAndView toCarList(HttpServletRequest request){
        ModelAndView mv = new ModelAndView("rentcar/car_list");
  //      mv.addObject("cars", carService.getAllCars());
        return mv;
    }

    @RequestMapping(value = "/select", method = RequestMethod.POST)
    @ResponseBody
    public Result selectCars(HttpServletRequest request){
        Result result = new Result();
        Map attrs = request.getParameterMap();
        List<Car> cars = carService.getCarsByAttributes(attrs);

        result.setSuccess(true);
        result.setData(cars);
        return result;
    }

    @RequestMapping(value = "/single")
    public ModelAndView toCarSingle(@RequestParam("id") Integer id){
        ModelAndView mv = new ModelAndView("rentcar/car_single");
        mv.addObject("car", carService.getCarById(id));
        mv.addObject("comments",carService.getCarComments(id));
        return mv;
    }

    @RequestMapping(value = "/rent_out")
    public String toRentOut(){
        return "rentcar/car_order_rentout";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public ModelAndView addCar(Car car){
        ModelAndView mv = new ModelAndView();
        if (carService.saveCar(car)){
            mv.setViewName("index");
        } else {
            mv.setViewName("error");
            mv.addObject("msg","提交失败");
        }
        return mv;
    }

    @RequestMapping(value = "/add/pic", method = RequestMethod.POST)
    @ResponseBody
    public Result addCarPic(@RequestParam(value = "pic") MultipartFile pic, HttpServletRequest request){
        Result result = new Result();
        String path = carService.saveCarPic(pic,request);
        if (path==null){
            result.setSuccess(false);
            result.setError("图片上传失败");
        } else {
            result.setSuccess(true);
            result.setData(path);
        }
        return result;
    }
}
