package com.comme.utils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
//    Logger logger = LoggerFactory.getLogger(HomeController.class);

    @RequestMapping(value =  "/")
    public String home() throws Exception {

        logger.info("home");
        return "home";
    }
}
