package com.example.electriccomponentsshop.repositories;

import com.example.electriccomponentsshop.entities.Account;
import com.example.electriccomponentsshop.entities.OrderTransaction;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface OrderTransactionRepository extends JpaRepository<OrderTransaction, Integer> {
Optional<OrderTransaction> findById(Integer id);
List<OrderTransaction> findAllByAccount(Account account);
}
