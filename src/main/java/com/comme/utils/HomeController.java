package com.comme.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
//    Logger logger = LoggerFactory.getLogger(HomeController.class);

    @RequestMapping(value =  "/")
    public String home() throws Exception {
        return "home";
    }
}
