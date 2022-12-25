package com.example.electriccomponentsshop.services.impl;

import com.example.electriccomponentsshop.dto.CustomerDTO;
import com.example.electriccomponentsshop.entities.Customer;
import com.example.electriccomponentsshop.repositories.CustomerRepository;
import com.example.electriccomponentsshop.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    CustomerRepository customerRepository;

    @Override
    public CustomerDTO addCustomer(CustomerDTO customerDTO) {
        Customer customer = new Customer();
        customer.setName(customerDTO.getName());
        customer.setPhone(customerDTO.getPhone());
        customer.setEmail(customerDTO.getEmail());
        customer.setAddress(customerDTO.getAddress());
        customer.setProvince(customerDTO.getProvince());
        customer.setDistrict(customerDTO.getDistrict());
        customer.setWard(customerDTO.getWard());
        customer.setNote(customerDTO.getNote());
        customer.setGender(customerDTO.getGender());

        Customer c = customerRepository.save(customer);

        CustomerDTO dto = new CustomerDTO();
        dto.setId(c.getId());
        dto.setName(c.getName());
        dto.setEmail(c.getEmail());
        dto.setPhone(c.getPhone());
        dto.setAddress(c.getAddress());
        dto.setProvince(c.getProvince());
        dto.setDistrict(c.getDistrict());
        dto.setWard(c.getWard());
        dto.setGender(c.getGender());
        dto.setNote(c.getNote());
        return dto;
    }
}
