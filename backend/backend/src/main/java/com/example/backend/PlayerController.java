package com.example.backend;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/player")
public class PlayerController {

    @GetMapping("/status")
    public String status() {
        return "Player API is active";
    }

    @PostMapping("/event")
    public String handleEvent(@RequestBody String payload) {
        System.out.println("Received from A-Frame: " + payload);
        return "Event received!";
    }
}

