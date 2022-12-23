package com.example.electriccomponentsshop.controller.admin;

import com.example.electriccomponentsshop.entities.Inventory;
import com.example.electriccomponentsshop.entities.InventoryExport;
import com.example.electriccomponentsshop.entities.Supplier;
import com.example.electriccomponentsshop.repositories.InventoryExportRepository;
import com.example.electriccomponentsshop.repositories.InventoryRepository;
import com.example.electriccomponentsshop.repositories.SupplierRepository;
import com.example.electriccomponentsshop.services.InventoryService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.util.Date;
import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("admin/inventory")
public class InventoryController {
    @Autowired
    final InventoryRepository inventoryRepository;
    @Autowired
    InventoryExportRepository inventoryExportRepository;
    @Autowired
    final SupplierRepository supplierRepository;

    final InventoryService inventoryService;

    @GetMapping("/search")
    public String searchInventory(@RequestParam(name = "date_type", required = false) String date_type,@RequestParam(name = "datedetail",required = false) String detailDate, ModelMap map){

        if(date_type == null && detailDate != null){
            System.out.println("dates: " + detailDate);
            String[] arrDate = detailDate.trim().split("-");
            String from_date = arrDate[0].trim();
            String to_date = arrDate[1].trim();

            List<Inventory> inventoryList = inventoryRepository.findInventoryByCreated_date(from_date,to_date +" 23:59:59");
            map.addAttribute("inventories", inventoryList);
            return "administrator/Inventory";
        }else{
            LocalDateTime now = LocalDateTime.now();
            int current_day = now.getDayOfMonth();
            int current_month = now.getMonthValue();
            int current_year = now.getYear();

            YearMonth yearMonth = YearMonth.of(current_year, current_month);
            int daysInMonth = yearMonth.lengthOfMonth();
            String from_date = "";
            String to_date = "";

            if(date_type.equals("today")){
                from_date += current_year + "-" + current_month + "-" + current_day;
                to_date += current_year + "-" + current_month + "-" + (current_day+1);

                List<Inventory> inventoryList = inventoryRepository.findInventoryByCreated_date(from_date,to_date);
                map.addAttribute("inventories", inventoryList);
                return "administrator/Inventory";
            }else if(date_type.equals("yesterday")){
                from_date += current_year + "-" + current_month + "-" + (current_day-1);
                to_date += current_year + "-" + current_month + "-" + (current_day);

                List<Inventory> inventoryList = inventoryRepository.findInventoryByCreated_date(from_date,to_date);
                map.addAttribute("inventories", inventoryList);
                return "administrator/Inventory";
            }else if(date_type.equals("thismonth")){
                from_date += current_year + "-" + current_month + "-" + "1";
                to_date += current_year + "-" + current_month + "-" + daysInMonth + " 23:59:59";

                List<Inventory> inventoryList = inventoryRepository.findInventoryByCreated_date(from_date,to_date);
                map.addAttribute("inventories", inventoryList);
                return "administrator/Inventory";
            }else if(date_type.equals("lastmonth")){
                if(current_month == 1){
                    current_month = 12;
                    current_year = current_year - 1;
                }else{
                    current_month = current_month - 1;
                }
                YearMonth yearMonth1 = YearMonth.of(current_year, current_month);
                from_date += current_year + "-" + current_month + "-" + "1";
                to_date += current_year + "-" + current_month + "-" + yearMonth1.lengthOfMonth() + " 23:59:59";
                List<Inventory> inventoryList = inventoryRepository.findInventoryByCreated_date(from_date,to_date);
                map.addAttribute("inventories", inventoryList);
                return "administrator/Inventory";
            }
        }
        List<Inventory> inventories = inventoryRepository.findInventoryByCreated_dateDesc();
        map.addAttribute("inventories", inventories);
        return "administrator/Inventory";
    }

    @GetMapping("/searchtext")
    public String SearchInventoryByCode(@RequestParam(name = "text") String code, ModelMap map){
        List<Inventory> inventories = inventoryRepository.findInventoryByCodeContaining(code);
        map.addAttribute("inventories", inventories);
        return "administrator/Inventory";
    }

    @GetMapping("export/search")
    public String searchInventoryExport(@RequestParam(name = "date_type", required = false) String date_type,@RequestParam(name = "datedetail",required = false) String detailDate, ModelMap map){

        if(date_type == null && detailDate != null){
            System.out.println("dates: " + detailDate);
            String[] arrDate = detailDate.trim().split("-");
            String from_date = arrDate[0].trim();
            String to_date = arrDate[1].trim();

            List<InventoryExport> inventoryList = inventoryExportRepository.findInventoryExportyByCreated_date(from_date,to_date +" 23:59:59");
            map.addAttribute("inventories", inventoryList);
            return "administrator/inventory-export";
        }else{
            LocalDateTime now = LocalDateTime.now();
            int current_day = now.getDayOfMonth();
            int current_month = now.getMonthValue();
            int current_year = now.getYear();

            YearMonth yearMonth = YearMonth.of(current_year, current_month);
            int daysInMonth = yearMonth.lengthOfMonth();
            String from_date = "";
            String to_date = "";

            if(date_type.equals("today")){
                from_date += current_year + "-" + current_month + "-" + current_day;
                to_date += current_year + "-" + current_month + "-" + (current_day+1);

                List<InventoryExport> inventoryList = inventoryExportRepository.findInventoryExportyByCreated_date(from_date,to_date);
                map.addAttribute("inventories", inventoryList);
                return "administrator/inventory-export";
            }else if(date_type.equals("yesterday")){
                from_date += current_year + "-" + current_month + "-" + (current_day-1);
                to_date += current_year + "-" + current_month + "-" + (current_day);

                List<InventoryExport> inventoryList = inventoryExportRepository.findInventoryExportyByCreated_date(from_date,to_date);
                map.addAttribute("inventories", inventoryList);
                return "administrator/inventory-export";
            }else if(date_type.equals("thismonth")){
                from_date += current_year + "-" + current_month + "-" + "1";
                to_date += current_year + "-" + current_month + "-" + daysInMonth + " 23:59:59";

                List<InventoryExport> inventoryList = inventoryExportRepository.findInventoryExportyByCreated_date(from_date,to_date);
                map.addAttribute("inventories", inventoryList);
                return "administrator/inventory-export";
            }else if(date_type.equals("lastmonth")){
                if(current_month == 1){
                    current_month = 12;
                    current_year = current_year - 1;
                }else{
                    current_month = current_month - 1;
                }
                YearMonth yearMonth1 = YearMonth.of(current_year, current_month);
                from_date += current_year + "-" + current_month + "-" + "1";
                to_date += current_year + "-" + current_month + "-" + yearMonth1.lengthOfMonth() + " 23:59:59";
                List<InventoryExport> inventoryList = inventoryExportRepository.findInventoryExportyByCreated_date(from_date,to_date);
                map.addAttribute("inventories", inventoryList);
                return "administrator/inventory-export";
            }
        }
        List<InventoryExport> inventories = inventoryExportRepository.findbyCreatedDate();
        map.addAttribute("inventories", inventories);
        return "administrator/inventory-export";
    }

    @GetMapping("export/searchtext")
    public String SearchInventoryExportByCode(@RequestParam(name = "text") String code, ModelMap map){
        List<InventoryExport> inventories = inventoryExportRepository.findInventoryExportByCodeContaining(code);
        map.addAttribute("inventories", inventories);
        return "administrator/inventory-export";
    }

}
