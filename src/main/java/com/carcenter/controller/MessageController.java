package com.carcenter.controller;

import com.carcenter.dto.Result;
import com.carcenter.model.Customer;
import com.carcenter.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by joy12 on 2017/12/13.
 */
@Controller
@RequestMapping("/message")
public class MessageController {
    @Autowired
    private MessageService messageService;

    @RequestMapping(value = "/send_message")
    public ModelAndView toSentMessage(@RequestParam("toId") int toId){
        ModelAndView mv = new ModelAndView("customer/send_message");
        mv.addObject("toId",toId);
        return mv;
    }

    @RequestMapping(value = "/read")
    @ResponseBody
    public void read(@RequestParam("idList") String idList,@RequestParam("status") int status){
        String[] strs = idList.split("#");
        int[] ids = new int[strs.length-1];
        for (int i=1; i<strs.length; i++){
            ids[i-1] = Integer.parseInt(strs[i]);
        }
        messageService.setReadStatus(ids,status);
    }

    @RequestMapping(value = "/sent")
    public ModelAndView sent(@RequestParam("toId") int toId,@RequestParam("content") String content,HttpSession session){
        ModelAndView mv = new ModelAndView();
        Customer customer = (Customer) session.getAttribute("customer");
        if (messageService.sendMsg(customer.getId(),toId,content)){
            mv.setViewName("index");
        } else {
            mv.setViewName("error");
            mv.addObject("msg","发送消息失败");
        }
        return mv;
    }
}
