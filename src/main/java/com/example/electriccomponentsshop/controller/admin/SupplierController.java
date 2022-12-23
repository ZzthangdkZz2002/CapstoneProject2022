package com.example.electriccomponentsshop.controller.admin;

import com.example.electriccomponentsshop.dto.ResponseObject;
import com.example.electriccomponentsshop.dto.SupplierDTO;
import com.example.electriccomponentsshop.entities.Inventory;
import com.example.electriccomponentsshop.entities.Supplier;
import com.example.electriccomponentsshop.repositories.InventoryRepository;
import com.example.electriccomponentsshop.repositories.SupplierRepository;
import com.example.electriccomponentsshop.services.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@CrossOrigin
@Controller
@RequestMapping("admin/suppliers")
public class SupplierController {

    @Autowired
    InventoryRepository inventoryRepository;
    @Autowired
    SupplierRepository supplierRepository;

    final
    SupplierService supplierService;

    public SupplierController(SupplierService supplierService) {
        this.supplierService = supplierService;
    }

    @GetMapping("")
    public String viewAll(Model model){
        List<Supplier> suppliers = supplierService.getAllSupplier();
        model.addAttribute("listSupplier",suppliers);
        return "administrator/supplier-management";
    }
    @PostMapping("/add")
    public String addNew(@RequestParam(name = "s_code")String code, @RequestParam(name = "s_name")String name , @RequestParam(name = "s_email")String email , @RequestParam(name = "phone")String phone ,
                         @RequestParam(name = "company")String company, @RequestParam(name = "address")String address , @RequestParam(name = "tax_code")String tax_code , @RequestParam(name = "note")String note, RedirectAttributes r){
        SupplierDTO supplierDTO = new SupplierDTO();
        supplierDTO.setCode(code);
        supplierDTO.setName(name);
        supplierDTO.setEmail(email);
        supplierDTO.setPhone(phone);
        supplierDTO.setCompany(company);
        supplierDTO.setAddress(address);
        supplierDTO.setTax_code(tax_code);
        supplierDTO.setNote(note);
        String error_code = supplierService.addSupplier(supplierDTO);
        if(error_code.equals("00")){
            return "redirect:/admin/suppliers";
        }else{
            r.addFlashAttribute("error","Thêm nhà cung cấp thất bại. Nhà cung cấp đã tồn tại");
            return "redirect:/admin/suppliers";
        }
    }

    @GetMapping("/searchncc")
    public String searchSupplier(Model model, @RequestParam(name = "ncc_text") String text){
        List<Supplier> suppliers = supplierRepository.findByCodeOrNameLike(text);
        model.addAttribute("listSupplier",suppliers);
        return "administrator/supplier-management";
    }
//    @GetMapping("/add")
//    public String viewAddForm(ModelMap modelMap){
//        modelMap.addAttribute("newSupplier",new SupplierDTO());
//        return "administrator/add-supplier";
//    }
    @PostMapping("/edit/{id}")
    public String update(@PathVariable(name="id") String id,@Valid @ModelAttribute("supplier")SupplierDTO supplierDTO, BindingResult bindingResult){
        supplierService.updateSupplier(supplierDTO,id);
        return "redirect:/admin/suppliers";
    }
    @GetMapping("/edit/{id}")
    public String viewFormUpdate(@PathVariable(name="id") String id,ModelMap modelMap){
        SupplierDTO supplierDTO = supplierService.getDtoById(id);
        modelMap.addAttribute("supplier",supplierDTO);
        return "administrator/setting-supplier";
    }
    @PostMapping("/disable")
    @ResponseBody
    public String disable(@RequestParam(name="id") String id ){
        try {
            supplierService.disableSupplier(id);
            return "Vô hiệu hóa thành công";
        }catch (RuntimeException e){
            return e.getMessage();
        }
    }
    @PostMapping("/enable")
    @ResponseBody
    public String enable(@RequestParam(name="id") String id ){
        try {
            supplierService.enableSupplier(id);
            return "Kích hoạt thành công";
        }catch (RuntimeException e){
            return e.getMessage();
        }
    }

    @GetMapping("/detail")
    public String detailSupplier(ModelMap map, @RequestParam(name = "sid") String s_id){
        List<Inventory> inventories = inventoryRepository.findInventoryBySupplierId(s_id);
        map.addAttribute("inventories", inventories);
        map.addAttribute("sid", s_id);
        return "administrator/supplierInventory";
    }

    @GetMapping("/search")
    public String searchInventory(@RequestParam(name = "sid") String s_id,@RequestParam(name = "date_type", required = false) String date_type,@RequestParam(name = "datedetail",required = false) String detailDate, ModelMap map){

        if(date_type == null && detailDate != null){
            System.out.println("dates: " + detailDate);
            String[] arrDate = detailDate.trim().split("-");
            String from_date = arrDate[0].trim();
            String to_date = arrDate[1].trim();

            List<Inventory> inventoryList = inventoryRepository.findInventoryByCreated_dateAndSupplier(from_date,to_date +" 23:59:59",s_id);
            map.addAttribute("inventories", inventoryList);
            map.addAttribute("sid", s_id);
            return "administrator/supplierInventory";
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

                List<Inventory> inventoryList = inventoryRepository.findInventoryByCreated_dateAndSupplier(from_date,to_date,s_id);
                map.addAttribute("inventories", inventoryList);
                map.addAttribute("sid", s_id);
                return "administrator/supplierInventory";
            }else if(date_type.equals("yesterday")){
                from_date += current_year + "-" + current_month + "-" + (current_day-1);
                to_date += current_year + "-" + current_month + "-" + (current_day);

                List<Inventory> inventoryList = inventoryRepository.findInventoryByCreated_dateAndSupplier(from_date,to_date,s_id);
                map.addAttribute("inventories", inventoryList);
                map.addAttribute("sid", s_id);
                return "administrator/supplierInventory";
            }else if(date_type.equals("thismonth")){
                from_date += current_year + "-" + current_month + "-" + "1";
                to_date += current_year + "-" + current_month + "-" + daysInMonth + " 23:59:59";

                List<Inventory> inventoryList = inventoryRepository.findInventoryByCreated_dateAndSupplier(from_date,to_date,s_id);
                map.addAttribute("inventories", inventoryList);
                map.addAttribute("sid", s_id);
                return "administrator/supplierInventory";
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
                List<Inventory> inventoryList = inventoryRepository.findInventoryByCreated_dateAndSupplier(from_date,to_date,s_id);
                map.addAttribute("inventories", inventoryList);
                map.addAttribute("sid", s_id);
                return "administrator/supplierInventory";
            }
        }
        List<Inventory> inventories = inventoryRepository.findInventoryByCreated_dateDesc();
        map.addAttribute("inventories", inventories);
        map.addAttribute("sid", s_id);
        return "administrator/supplierInventory";
    }

    @GetMapping("/searchtext")
    public String SearchInventoryByCode(@RequestParam(name = "text") String code, @RequestParam(name = "sid") String s_id, ModelMap map){
        List<Inventory> inventories = inventoryRepository.findInventoryByCodeAndSupplier(code, s_id);
        map.addAttribute("inventories", inventories);
        map.addAttribute("sid", s_id);
        return "administrator/supplierInventory";
    }

}
