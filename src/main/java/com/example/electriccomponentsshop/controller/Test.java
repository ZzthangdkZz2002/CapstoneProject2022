package com.example.electriccomponentsshop.controller;

import com.example.electriccomponentsshop.services.impl.AWSService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/demo")
public class Test {

    private AWSService awsService;

    @Autowired
    Test(AWSService awsService) {
        this.awsService = awsService;
    }

    @PostMapping("")
    public ResponseEntity<String> testD(@RequestParam("file") MultipartFile file) {
        String fileName = awsService.upload(file);
        return ResponseEntity.status(HttpStatus.OK).body(fileName);
    }
}
