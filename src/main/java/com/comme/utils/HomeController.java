package com.comme.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.comme.board.BoardService;

@Controller
public class HomeController {
	@Autowired
	private BoardService service;
    Logger logger = LoggerFactory.getLogger(HomeController.class);

    @RequestMapping(value =  "/")
    public String home(Model model) throws Exception {
        logger.info("home");
        
        model.addAttribute("mainCategory", service.mainCategory());
        model.addAttribute("inquiry", service.inquiryCategory());
        return "home";
    }
}
