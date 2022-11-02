package com.example.electriccomponentsshop.services;

import com.example.electriccomponentsshop.dto.OrderTransactionDTO;
import com.example.electriccomponentsshop.entities.OrderTransaction;
import org.springframework.security.core.Authentication;

public interface OrderTransactionService {
    OrderTransaction addTransaction(OrderTransactionDTO orderTransactionDTO, Authentication authentication);

}
