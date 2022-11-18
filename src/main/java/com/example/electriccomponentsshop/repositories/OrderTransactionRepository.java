package com.example.electriccomponentsshop.repositories;

import com.example.electriccomponentsshop.entities.Account;
import com.example.electriccomponentsshop.entities.OrderTransaction;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface OrderTransactionRepository extends JpaRepository<OrderTransaction, Integer> {
Optional<OrderTransaction> findById(Integer id);
Optional<OrderTransaction> findByOrderid(String orderid);
List<OrderTransaction> findAllByAccountuser(Account accountuser);
List<OrderTransaction> findAllByAccountuserAndStatus(Account accountuser, String status);
List<OrderTransaction> findAllByStatus(String status);
}
