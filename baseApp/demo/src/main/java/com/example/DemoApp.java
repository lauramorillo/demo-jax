package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
@RestController
public class DemoApp {

	public static void main(String[] args) {
		SpringApplication.run(DemoApp.class, args);
	}

    @RequestMapping("/")
    public String hello(){
        return "Hello JAX London!";
    }
}