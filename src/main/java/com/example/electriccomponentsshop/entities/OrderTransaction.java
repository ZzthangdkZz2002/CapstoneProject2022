package com.example.electriccomponentsshop.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.boot.context.properties.bind.DefaultValue;

import javax.persistence.*;
import java.util.*;

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

    //nguoi tao don hang
    @ManyToOne(fetch =  FetchType.LAZY)
    @JoinColumn(name = "employee_id")
    private Account accountemployee;

    //nguoi xử lý đơn hàng
    @ManyToOne(fetch =  FetchType.LAZY)
    @JoinColumn(name = "processor_id")
    private Account employeeProcessor;

    @ManyToOne(fetch =  FetchType.LAZY)
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @OneToOne(mappedBy = "orderTransaction",optional = true)
    private ExportTransactionNew exportTransactionNew;

    @OneToMany(mappedBy = "orderTransaction",fetch = FetchType.EAGER)
    private Set<OrderTransactionDetail> orderTransactionDetails = new HashSet<>();
    @OneToMany(mappedBy = "orderTransaction",fetch = FetchType.EAGER)
    private Set<InventoryExport> inventoryExports = new HashSet<>();
    private String user_name;
    private String user_email;
    private String user_phone;
    //dia chi chi tiet giao hang
    private String address;
    //tinh thanh
    private String province;
    //Quan huyen
    private String district;
    //khu vuc
    private String ward;
    //tong so tien can thanh toan
    private double amount;
    //da len don sang ben van chuyen chua
    @Column
    @ColumnDefault("0")
    private Boolean isShipping;

    //code don hang Giao Hang Nhanh
    @Column
    private String order_code;
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
    @Column(updatable = false)
    private Date created;

    @CreationTimestamp
    @Column
    private Date updatedDate;
}
