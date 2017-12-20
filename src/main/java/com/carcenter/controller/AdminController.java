package com.carcenter.controller;

import com.carcenter.dto.Result;
import com.carcenter.model.Admin;
import com.carcenter.model.Customer;
import com.carcenter.model.News;
import com.carcenter.service.*;
import com.carcenter.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

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
    CarService carService;

    @Autowired
    CarOrderService  carOrderService;

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

    @RequestMapping(value = "/index")
    public String toIndexv1(){
        return "admin/index";
    }

    @RequestMapping(value = "/main")
    public String toAdminIndex(){
        return "admin/main";
    }

    @RequestMapping(value = "/release_parking")
    public String toReleaseParking(){
        return "admin/release_parking";
    }

    @RequestMapping(value = "/release_news")
    public String toReleaseNews(){return "admin/release_news";}

    @RequestMapping(value = "/add_user")
    public String toAddUser(){
        return "admin/add_user";
    }

    @RequestMapping(value = "/clients")
    public ModelAndView toCustomer(){
        ModelAndView mv = new ModelAndView("admin/clients");
        mv.addObject("clients",customerService.getAllCustomers());
        return mv;
    }

    @RequestMapping(value = "/article")
    public ModelAndView toArticle(@RequestParam(value = "id") int id){
        ModelAndView mv = new ModelAndView("admin/article");
        mv.addObject("news",newsService.getNewsById(id));
        return mv;
    }

    @RequestMapping(value = "/parking_lot")
    public ModelAndView toParkingSpace(){
        ModelAndView mv = new ModelAndView("admin/parking_lot");
        mv.addObject("parkspace",parkingService.getAllParkingLot());
        return mv;
    }

    @RequestMapping(value = "/searchParkingLot")
    public ModelAndView searchParkingSpace(@RequestParam(value = "value") String value){
        ModelAndView mv = new ModelAndView("admin/parking_lot");
        mv.addObject("parkspace",parkingService.getParkingLotByAttr(value));
        return mv;
    }

    @RequestMapping(value = "/addUser")
    @ResponseBody
    public Result addUser(@ModelAttribute Customer customer){
        Result result = new Result();
        if (customerService.register(customer)){
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
            result.setError("手机号已被注册");
        }
        return result;
    }

    @RequestMapping(value = "/delete_user")
    @ResponseBody
    public Result deleteUser(@RequestParam int id){
        Result result = new Result();
        if (customerService.deleteCustomer(id)){
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
            result.setError("删除用户失败");
        }
        return result;
    }

    @RequestMapping(value = "/deleteNews")
    @ResponseBody
    public Result deleteNews(@RequestParam int id){
        Result result = new Result();
        if (newsService.deleteNews(id)){
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
            result.setError("删除新闻失败");
        }
        return result;
    }

    @RequestMapping(value = "/delete_lot")
    @ResponseBody
    public Result deleteLot(@RequestParam int id){
        Result result = new Result();
        if (parkingService.deleteLot(id)){
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
            result.setError("删除停车场失败");
        }
        return result;
    }


    @RequestMapping(value = "/mailbox")
    public ModelAndView toMessage(){
        ModelAndView mv = new ModelAndView("admin/mailbox");
        mv.addObject("message",messageService.getAllMsg());
        return mv;
    }

    @RequestMapping(value = "/releaseNews")
    @ResponseBody
    public Result releaseNews(@ModelAttribute News news){
        Result result = new Result();
        if (newsService.release(news)){
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
            result.setError("此标题已被占用");
        }
        return result;
    }

    @RequestMapping(value = "/releaseParking")
    @ResponseBody
    public Result releaseParking(ParkingLot parkingLot){
        Result result = new Result();
        if (parkingService.release(parkingLot)){
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
            result.setError("此停车场已存在");
        }
        return result;
    }


    @RequestMapping(value = "/query_news")
    public ModelAndView toQueryNews(){
        ModelAndView mv = new ModelAndView("admin/query_news");
        mv.addObject("news",newsService.getAllNews());
        return mv;
    }
    @RequestMapping(value = "/find_car_order")
    public ModelAndView toFindCarOrder(){
        ModelAndView mv = new ModelAndView("admin/find_car_order");
        mv.addObject("carorder", carOrderService.getAllCarOrder());
        return mv;
    }
    @RequestMapping(value = "/find_space_order")
    public ModelAndView toFindParkingOrder(){
        ModelAndView mv = new ModelAndView("admin/find_space_order");
        mv.addObject("parkingorder", parkingOrderService.getAllParkingOrder());
        return mv;
    }
    @RequestMapping(value = "/car")
    public ModelAndView toFindCar(){
        ModelAndView mv = new ModelAndView("admin/car");
        mv.addObject("car", carService.getAllCars());
        return mv;
    }
    @RequestMapping(value = "/check_car")
    public ModelAndView toFindCarCheck(){
        ModelAndView mv = new ModelAndView("admin/check_car");
        mv.addObject("carcheck", carService.getCarsNeedCheck());
        return mv;
    }

    @RequestMapping(value = "/checkCar")
    @ResponseBody
    public Result checkCar(@RequestParam("carId") int id){
        Result result = new Result();
        if (carService.checkCar(id)){
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
            result.setError("审核失败");
        }
        return result;
    }

    @RequestMapping(value = "/check_car_order")
    public ModelAndView toCheckCarOrder(){
        ModelAndView mv = new ModelAndView("admin/start_car_order");
   //     mv.addObject("carneedcheck", ());
        return mv;
    }
    @RequestMapping(value = "/selectCustomer", method = RequestMethod.POST)
    @ResponseBody
    public Result selectClient(@RequestParam(value = "search") String value){
        Result result = new Result();
        List<Customer> customers = customerService.getCustomerByAttribute(value);
        result.setSuccess(true);
        result.setData(customers);
        return result;
    }

    @RequestMapping(value = "/car_detail")
    public ModelAndView selectCar(@RequestParam(value = "id") int id){
        ModelAndView mv = new ModelAndView("admin/car_detail");
        Car car = carService.getCarById(id);
        mv.addObject("car", car);
        mv.addObject("comments",carService.getCarComments(id));
        return mv;
    }

    @RequestMapping(value = "/start_car_order")
    public ModelAndView toStartCarOrder(){
        ModelAndView mv = new ModelAndView("admin/start_car_order");
        mv.addObject("startorder",carOrderService.startCarOrder());
        return mv;
    }
    @RequestMapping(value = "/end_car_order")
    public ModelAndView toEndCarOrder(){
        ModelAndView mv = new ModelAndView("admin/end_car_order");
        mv.addObject("endorder",carOrderService.endCarOrder());
        return mv;
    }

    @RequestMapping(value = "/start_parking_order")
    public ModelAndView toStartParkingOrder(){
        ModelAndView mv = new ModelAndView("admin/start_space_order");
        mv.addObject("startorder",parkingOrderService.getStartParkingOrder());
        return mv;
    }
    @RequestMapping(value = "/end_parking_order")
    public ModelAndView toEndParkingOrder(){
        ModelAndView mv = new ModelAndView("admin/end_space_order");
        mv.addObject("endorder",parkingOrderService.getEndParkingOrder());
        return mv;
    }

    @RequestMapping(value = "/startCarOrder")
    @ResponseBody
    public Result startCarOrder(@RequestParam("orderId") int orderId){
        Result result = new Result();
        if (carOrderService.startOrderByAdmin(orderId)){
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
            result.setError("操作失败");
        }

        return result;
    }

    @RequestMapping(value = "/endCarOrder")
    @ResponseBody
    public Result endCarOrder(@RequestParam("orderId") int orderId){
        Result result = new Result();
        if (carOrderService.endOrderByAdmin(orderId)){
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
            result.setError("操作失败");
        }

        return result;
    }

    @RequestMapping(value = "/startParkingOrder")
    @ResponseBody
    public Result startParkingOrder(@RequestParam("orderId") int orderId){
        Result result = new Result();
        if (parkingService.startOrderByAdmin(orderId)){
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
            result.setError("操作失败");
        }

        return result;
    }

    @RequestMapping(value = "/endParkingOrder")
    @ResponseBody
    public Result endParkingOrder(@RequestParam("orderId") int orderId){
        Result result = new Result();
        if (parkingService.endOrderByAdmin(orderId)){
            result.setSuccess(true);
        } else {
            result.setSuccess(false);
            result.setError("操作失败");
        }

        return result;
    }
}
