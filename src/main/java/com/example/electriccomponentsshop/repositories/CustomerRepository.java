package com.example.electriccomponentsshop.repositories;

import com.example.electriccomponentsshop.entities.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CustomerRepository extends JpaRepository<Customer,Integer> {
    Optional<Customer> findByPhone(String phone);
}
