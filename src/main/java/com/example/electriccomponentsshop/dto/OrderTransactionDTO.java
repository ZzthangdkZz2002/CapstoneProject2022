package com.example.electriccomponentsshop.dto;

import com.example.electriccomponentsshop.entities.OrderTransactionDetail;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderTransactionDTO {

    private Integer id;
    private String orderid;
    private String status;

    private String user_name;
    private String user_email;
    private String user_phone;
    //dia chi giao hang
    private String address;
    //tong so tien can thanh toan
    private String amount;
    private String payment_method;
    //message tu khach hang
    private String message;

    private Date created;

    private List<OrderTransactionDetailDTO> orderTransactionDetails;
}
