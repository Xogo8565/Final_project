package com.comme.error;

import com.comme.board.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {
    @Autowired
    private BoardService boardService;
    
    @GetMapping("/error")
    public String error(Model model) throws Exception {
        model.addAttribute("mainCategory", boardService.mainCategory());
        model.addAttribute("inquiry", boardService.inquiryCategory());
        return "error";
    }
}
