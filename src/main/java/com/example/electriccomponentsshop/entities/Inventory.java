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
    private int real_quantity;
    private BigDecimal real_totalPrice;
    private int difference_quantity;
    private int difference_quantityUp;
    private int difference_quantityDown;
    private String creator_name;
    private String note;

    private String product_code;

    @ManyToOne
    @JoinColumn(name = "warehouse_id")
    private Warehouse warehouse;
}
