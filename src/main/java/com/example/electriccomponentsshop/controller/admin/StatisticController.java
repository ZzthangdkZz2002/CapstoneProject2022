package com.example.electriccomponentsshop.controller.admin;

import com.example.electriccomponentsshop.dto.ResponseObject;
import com.example.electriccomponentsshop.dto.StatisticDTO;
import com.example.electriccomponentsshop.repositories.OrderTransactionRepository;
import com.example.electriccomponentsshop.services.StatisticService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/stats")
@AllArgsConstructor
public class StatisticController {

    @Autowired
    OrderTransactionRepository orderTransactionRepository;

    final StatisticService statisticService;

    @GetMapping("/statsByDay")
    public String[] statisticByDay(){
        String[] data =  statisticService.statsByCurrentDay();
        return data;
    }
}
