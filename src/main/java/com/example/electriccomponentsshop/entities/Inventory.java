package com.example.electriccomponentsshop.entities;

import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Inventory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String code;
    @CreationTimestamp
    @Column(updatable = false)
    private Date created_date;
    private Integer real_quantity;
    private BigDecimal real_totalPrice;
    private int difference_quantity;
    private int difference_quantityUp;
    private int difference_quantityDown;
    private BigDecimal money_mustPay;
    private String creator_name;
    private String note;
    private String receiver;

    private String product_code;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "warehouse_id")
    private Warehouse warehouse;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "supplier_id")
    private Supplier supplier;
}
