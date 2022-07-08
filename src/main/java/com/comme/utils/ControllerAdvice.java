package com.comme.utils;

import org.springframework.web.bind.annotation.ExceptionHandler;

@org.springframework.web.bind.annotation.ControllerAdvice
public class ControllerAdvice {
    @ExceptionHandler
    public String ExceptionHandler(Exception e){
        e.printStackTrace();
        return "redirect:/error";
    }
}
