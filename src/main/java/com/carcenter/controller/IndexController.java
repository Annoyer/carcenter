package com.carcenter.controller;

import com.carcenter.dto.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by joy12 on 2017/12/3.
 */
@Controller
public class IndexController {

    //非ajax单纯指向某个页面示例
    @RequestMapping(value = "/index")
    public String toIndex(){
        return "index";
    }
}
