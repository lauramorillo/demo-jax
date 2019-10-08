package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@SpringBootApplication
@RestController
public class DemoApp {

	public static void main(String[] args) {
		SpringApplication.run(DemoApp.class, args);
	}

    @ResponseBody
    @RequestMapping(
            value = "/",
            method = RequestMethod.GET,
            produces = MediaType.IMAGE_PNG_VALUE
    )
    public ResponseEntity<InputStreamResource> getPizza() {
        return ResponseEntity.ok()
                .body(new InputStreamResource(getClass().getResourceAsStream("/static/pizza.png")));

    }
}
