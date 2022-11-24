package com.example.electriccomponentsshop.controller.admin;

import com.example.electriccomponentsshop.services.StatisticService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@CrossOrigin
@AllArgsConstructor
@Controller
@RequestMapping("/admin/home")
public class HomeController {

    final StatisticService statisticService;

    @GetMapping("")
    public String viewHome(ModelMap map){
        String[] data =  statisticService.statsByCurrentDay();
        map.addAttribute("data", data);
        map.addAttribute("title", "Doanh thu, lợi nhuận ngày hôm nay");
        return "administrator/admin-home";
    }

    @GetMapping("/stats")
    public String Statistic(@RequestParam(name = "date") String date_type, ModelMap map){
        if("today".equals(date_type)){
            String[] data =  statisticService.statsByCurrentDay();
            map.addAttribute("data", data);
            map.addAttribute("title", "Doanh thu, lợi nhuận ngày hôm nay");
            return "administrator/admin-home";
        }
        else if("month".equals(date_type)){
            String[] data =  statisticService.statsMonthByYear();
            map.addAttribute("data", data);
            map.addAttribute("title", "Doanh thu, lợi nhuận các tháng trong năm");
            return "administrator/admin-home";
        }
        else if("year".equals(date_type)){
            String[] data =  statisticService.statsByYear();
            map.addAttribute("data", data);
            map.addAttribute("title", "Doanh thu, lợi nhuận các năm");
            return "administrator/admin-home";
        }
        String[] data =  statisticService.statsByCurrentDay();
        map.addAttribute("data", data);
        return "administrator/admin-home";
    }
}
