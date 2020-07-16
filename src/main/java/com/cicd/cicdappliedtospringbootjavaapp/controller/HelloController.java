package com.cicd.cicdappliedtospringbootjavaapp.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

        @GetMapping("/")
        public String home() {
        return "Welcome To Nucleus";
    }
        @GetMapping("/sudo")
        public String home1() {
        return "Spring Boot Tetsting ";
    }
}
