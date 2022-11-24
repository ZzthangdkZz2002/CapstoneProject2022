package com.example.electriccomponentsshop.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.boot.context.properties.bind.DefaultValue;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class OrderTransaction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String orderid;
    private String status;

    @ManyToOne(fetch =  FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private Account accountuser;

    @ManyToOne(fetch =  FetchType.LAZY)
    @JoinColumn(name = "employee_id")
    private Account accountemployee;

    @ManyToOne(fetch =  FetchType.LAZY)
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @OneToMany(mappedBy = "orderTransaction",fetch = FetchType.EAGER)
    private List<OrderTransactionDetail> orderTransactionDetails = new ArrayList<>();
    private String user_name;
    private String user_email;
    private String user_phone;
    //dia chi giao hang
    private String address;
    //tong so tien can thanh toan
    private double amount;
    //loi nhuan
    @Column
    @ColumnDefault("0")
    private double profit;
    private String payment_method;
    private String payment_info;
    //message tu khach hang
    private String message;
    @Column
    @ColumnDefault("0")
    private Boolean isPaid;
    private String orderKind;
    @CreationTimestamp
    @Temporal(TemporalType.DATE)
    @Column(updatable = false)
    private Date created;
}
