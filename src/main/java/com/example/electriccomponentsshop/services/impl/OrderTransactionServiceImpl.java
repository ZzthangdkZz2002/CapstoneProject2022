package com.example.electriccomponentsshop.services.impl;

import com.example.electriccomponentsshop.common.OrderEnum;
import com.example.electriccomponentsshop.common.Utils;
import com.example.electriccomponentsshop.dto.OrderTransactionDTO;
import com.example.electriccomponentsshop.dto.OrderTransactionDetailDTO;
import com.example.electriccomponentsshop.entities.Account;
import com.example.electriccomponentsshop.entities.OrderTransaction;
import com.example.electriccomponentsshop.entities.OrderTransactionDetail;
import com.example.electriccomponentsshop.repositories.AccountRepository;
import com.example.electriccomponentsshop.repositories.OrderTransactionDetailRepository;
import com.example.electriccomponentsshop.repositories.OrderTransactionRepository;
import com.example.electriccomponentsshop.services.AccountDetailImpl;
import com.example.electriccomponentsshop.services.OrderTransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

@Service
public class OrderTransactionServiceImpl implements OrderTransactionService {
    @Autowired
    OrderTransactionRepository orderTransactionRepository;
    @Autowired
    OrderTransactionDetailRepository orderTransactionDetailRepository;
    @Autowired
    AccountRepository accountRepository;
    @Override
    public OrderTransaction addTransactionOnline(OrderTransactionDTO orderTransactionDTO , Authentication authentication) {
        try{
            OrderTransaction orderTransaction = new OrderTransaction();

            if(authentication != null){
                AccountDetailImpl accountDetail = (AccountDetailImpl) authentication.getPrincipal();
                Account account = accountRepository.findById(accountDetail.getId()).get();
                orderTransaction.setAccountuser(account);
            }


            orderTransaction.setOrderid(new Utils().gererateOrderid());
            orderTransaction.setUser_name(orderTransactionDTO.getUser_name());
            orderTransaction.setUser_email(orderTransactionDTO.getUser_email());
            orderTransaction.setUser_phone(orderTransactionDTO.getUser_phone());
            orderTransaction.setAddress(orderTransactionDTO.getAddress());
            orderTransaction.setAmount(Double.parseDouble(orderTransactionDTO.getAmount()));
            orderTransaction.setPayment_method(orderTransactionDTO.getPayment_method());
            orderTransaction.setMessage(orderTransactionDTO.getMessage());
            orderTransaction.setStatus(OrderEnum.PENDING.getName());
            orderTransaction.setOrderKind("online");

            OrderTransaction o = orderTransactionRepository.save(orderTransaction);

            for(OrderTransactionDetailDTO dto : orderTransactionDTO.getOrderTransactionDetails()){
                OrderTransactionDetail orderTransactionDetail = new OrderTransactionDetail();
                orderTransactionDetail.setOrderTransaction(o);
                orderTransactionDetail.setProduct_id(dto.getProduct_id());
                orderTransactionDetail.setQuantity(dto.getQuantity());
                orderTransactionDetail.setAmount(dto.getAmount());

                orderTransactionDetailRepository.save(orderTransactionDetail);
            }
            return o;
        }catch (Exception e){
            System.out.println("addTransaction Error: " + e.getMessage());
            return null;
        }

    }

}
