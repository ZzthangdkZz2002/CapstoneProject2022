package com.example.electriccomponentsshop.controller.admin;

import com.example.electriccomponentsshop.common.OrderEnum;
import com.example.electriccomponentsshop.dto.AccountDTO;
import com.example.electriccomponentsshop.entities.Customer;
import com.example.electriccomponentsshop.entities.OrderTransaction;
import com.example.electriccomponentsshop.repositories.CustomerRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@CrossOrigin
@Controller
@RequestMapping("admin/customer")
@AllArgsConstructor
public class CustomerAdminController {

    CustomerRepository customerRepository;

    @GetMapping("")
    public String viewAllCustomer(Model model){
        List<Customer> customerList = customerRepository.findAll();
        model.addAttribute("customers",customerList);
        return "administrator/customer-management";
    }
    @GetMapping("/viewOrder")
    public String viewAllCustomerOrder(Model model, @RequestParam(name = "id") Integer id){
        Customer customer = customerRepository.findById(id).get();
        List<OrderTransaction> orderTransactions = customer.getOrderTransactions();
//        List<OrderTransaction> orderTransactionList = new ArrayList<>();
//        for(OrderTransaction orderTransaction : orderTransactions){
//            if(orderTransaction.getStatus().equalsIgnoreCase(OrderEnum.DONE.getName())){
//                orderTransactionList.add(orderTransaction);
//            }
//        }
        model.addAttribute("orders",orderTransactions);
        return "administrator/customerOrder";
    }
}
