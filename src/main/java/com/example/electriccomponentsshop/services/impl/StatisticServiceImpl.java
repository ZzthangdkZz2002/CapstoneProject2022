package com.example.electriccomponentsshop.services.impl;

import com.example.electriccomponentsshop.dto.StatisticDTO;
import com.example.electriccomponentsshop.repositories.OrderTransactionRepository;
import com.example.electriccomponentsshop.services.StatisticService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.time.LocalDate;
import java.util.*;

@Service
public class StatisticServiceImpl implements StatisticService {

    @Autowired
    OrderTransactionRepository orderTransactionRepository;

    @Override
    public String[] statsMonthByYear() {
        String[] dataStats = new String[2];
        List<StatisticDTO> statisticDTOS = orderTransactionRepository.statsMonthByYear(String.valueOf(LocalDate.now().getYear()));

        Gson gsonObj = new Gson();
        Map<Object,Object> map = null;
        List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

        for(StatisticDTO statisticDTO : statisticDTOS){
            map = new HashMap<Object,Object>();
            map.put("label", statisticDTO.getDate());
            map.put("y", statisticDTO.getRevenue());
            list.add(map);
        }
        //for revenue stats
        dataStats[0] = gsonObj.toJson(list);

        list = new ArrayList<Map<Object,Object>>();
        for(StatisticDTO statisticDTO : statisticDTOS){
            map = new HashMap<Object,Object>();
            map.put("label", statisticDTO.getDate());
            map.put("y", statisticDTO.getProfit());
            list.add(map);
        }
        //for profit stats
        dataStats[1] = gsonObj.toJson(list);

        return dataStats;
    }

    @Override
    public String[] statsByYear() {
        String[] dataStats = new String[2];
        List<StatisticDTO> statisticDTOS = orderTransactionRepository.statsByYear();

        Gson gsonObj = new Gson();
        Map<Object,Object> map = null;
        List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

        for(StatisticDTO statisticDTO : statisticDTOS){
            map = new HashMap<Object,Object>();
            map.put("label", statisticDTO.getDate());
            map.put("y", statisticDTO.getRevenue());
            list.add(map);
        }
        //for revenue stats
        dataStats[0] = gsonObj.toJson(list);

        list = new ArrayList<Map<Object,Object>>();
        for(StatisticDTO statisticDTO : statisticDTOS){
            map = new HashMap<Object,Object>();
            map.put("label", statisticDTO.getDate());
            map.put("y", statisticDTO.getProfit());
            list.add(map);
        }
        //for profit stats
        dataStats[1] = gsonObj.toJson(list);

        return dataStats;
    }

    @Override
    public String[] statsByCurrentDay() {
        String[] dataStats = new String[2];
        StatisticDTO statisticDTO = orderTransactionRepository.statsByCurrentDay();
        Gson gsonObj = new Gson();
        Map<Object,Object> map = null;
        List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
        map = new HashMap<Object,Object>();
        if(statisticDTO != null){
            map.put("label", statisticDTO.getDate());
            map.put("y", statisticDTO.getRevenue());
            list.add(map);
        }
        //for revenue stats
        dataStats[0] = gsonObj.toJson(list);

        list = new ArrayList<Map<Object,Object>>();
        map = new HashMap<Object,Object>();
        if(statisticDTO != null){
            map.put("label", statisticDTO.getDate());
            map.put("y", statisticDTO.getProfit());
            list.add(map);
        }
        //for profit stats
        dataStats[1] = gsonObj.toJson(list);

        return dataStats;
    }
}
