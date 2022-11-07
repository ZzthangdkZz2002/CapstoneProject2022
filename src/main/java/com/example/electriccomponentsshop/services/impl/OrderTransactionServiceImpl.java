package com.example.electriccomponentsshop.services.impl;

import com.example.electriccomponentsshop.common.OrderEnum;
import com.example.electriccomponentsshop.common.Utils;
import com.example.electriccomponentsshop.dto.OrderTransactionDTO;
import com.example.electriccomponentsshop.dto.OrderTransactionDetailDTO;
import com.example.electriccomponentsshop.entities.*;
import com.example.electriccomponentsshop.repositories.*;
import com.example.electriccomponentsshop.services.AccountDetailImpl;
import com.example.electriccomponentsshop.services.OrderTransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Optional;

@Service
public class OrderTransactionServiceImpl implements OrderTransactionService {
    @Autowired
    OrderTransactionRepository orderTransactionRepository;
    @Autowired
    OrderTransactionDetailRepository orderTransactionDetailRepository;
    @Autowired
    AccountRepository accountRepository;
    @Autowired
    ProductRepository productRepository;
    @Autowired
    CustomerRepository customerRepository;
    @Override
    public OrderTransaction addTransactionOnline(OrderTransactionDTO orderTransactionDTO , Authentication authentication) {
        try{
            OrderTransaction orderTransaction = new OrderTransaction();
            Customer customer = new Customer();
            if(authentication != null){
                AccountDetailImpl accountDetail = (AccountDetailImpl) authentication.getPrincipal();
                Account account = accountRepository.findById(accountDetail.getId()).get();
                orderTransaction.setAccountuser(account);
                customer.setName(account.getName());
                customer.setEmail(account.getEmail());
                customer.setPhone(account.getPhone());
                customer.setAddress(account.getDetailLocation());
//                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//                Date parsed = (Date) format.parse(account.getDob());
//                java.sql.Date date = new java.sql.Date(parsed.getTime());
//                customer.setDob(date);
                customer.setGender(account.getGender());
            }else{
                customer.setName(orderTransactionDTO.getUser_name());
                customer.setEmail(orderTransactionDTO.getUser_email());
                customer.setPhone(orderTransactionDTO.getUser_phone());
                customer.setAddress(orderTransactionDTO.getAddress());
            }

            if(!customerRepository.findByPhone(orderTransactionDTO.getUser_phone()).isPresent()){
                orderTransaction.setCustomer(customerRepository.save(customer));
            }else{
                orderTransaction.setCustomer(customerRepository.findByPhone(orderTransactionDTO.getUser_phone()).get());
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

    @Override
    public double calOrderProfit(Integer order_id) {
        Optional<OrderTransaction> orderTransaction = orderTransactionRepository.findById(order_id);
        double profit = 0;
        if(orderTransaction.isPresent()){
            List<OrderTransactionDetail> orderTransactionDetails = orderTransactionDetailRepository.findAllByOrderTransaction(orderTransaction.get());
            for(OrderTransactionDetail od : orderTransactionDetails){
                Optional<Product> product = productRepository.findById(od.getProduct_id());
                if(product.isPresent()){
                    profit += od.getAmount() - od.getQuantity() * product.get().getOriginal_price().doubleValue();
                }
            }
            return profit;
        }
        return 0;
    }


}
