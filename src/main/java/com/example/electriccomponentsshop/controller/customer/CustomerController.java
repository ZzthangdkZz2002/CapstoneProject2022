package com.example.electriccomponentsshop.controller.customer;

import com.example.electriccomponentsshop.dto.CustomerDTO;
import com.example.electriccomponentsshop.dto.ResponseObject;
import com.example.electriccomponentsshop.entities.Customer;
import com.example.electriccomponentsshop.repositories.CustomerRepository;
import com.example.electriccomponentsshop.services.CustomerService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@AllArgsConstructor
@Controller
@RequestMapping("customer")
public class CustomerController {

    @Autowired
    CustomerRepository customerRepository;
    final CustomerService customerService;

    @GetMapping("/customers")
    @ResponseBody
    public ResponseEntity<ResponseObject> getAllCustomer(){
        List<Customer> customers = customerRepository.findAll();
        return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","get customer success",customers));
    }

    @PostMapping("/addCustomer")
    @ResponseBody
    public ResponseEntity<ResponseObject> addCustomerOffline(@RequestBody CustomerDTO customerDTO){
        try {
            if(customerRepository.findByPhone(customerDTO.getPhone()).isPresent()){
                return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","Khách hàng đã tồn tại!",""));
            }else{
                CustomerDTO dto = customerService.addCustomer(customerDTO);
                return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","add customer success",dto));
            }
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","add customer fail",""));
        }
    }
}
