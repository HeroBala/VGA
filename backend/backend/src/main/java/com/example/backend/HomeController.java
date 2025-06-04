package com.example.backend;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "🚀 Backend is running!";
    }

    @GetMapping("/api/ping")
    public String ping() {
        return "pong";
    }
}

