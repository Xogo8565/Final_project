package com.comme.error;

import org.springframework.web.bind.annotation.GetMapping;

public class ErrorController {
    @GetMapping("/error")
    public String error() throws Exception {
        return "/error";
    }
}
