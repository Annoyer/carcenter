package com.carcenter.controller;

import com.carcenter.dto.Result;
import com.carcenter.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by joy12 on 2017/12/3.
 */
@Controller
public class IndexController {
    @Autowired
    NewsService newsService;

    //非ajax单纯指向某个页面示例
    @RequestMapping(value = "/index")
    public ModelAndView toIndex(){
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("news", newsService.getAllNews());
        return mv;
    }

    @RequestMapping(value = "/news")
    public ModelAndView toNews(@RequestParam(value = "newsId") int newId){
        ModelAndView mv = new ModelAndView("news");
        mv.addObject("news", newsService.getNewsById(newId));
        return mv;
    }
}
