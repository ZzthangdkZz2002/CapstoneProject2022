package com.example.electriccomponentsshop.repositories;

import com.example.electriccomponentsshop.entities.OrderTransaction;
import com.example.electriccomponentsshop.entities.OrderTransactionDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderTransactionDetailRepository extends JpaRepository<OrderTransactionDetail, Integer> {
    List<OrderTransactionDetail> findAllByOrderTransaction(OrderTransaction orderTransaction);
}
