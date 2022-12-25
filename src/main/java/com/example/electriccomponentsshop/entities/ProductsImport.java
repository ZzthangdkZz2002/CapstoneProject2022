package com.example.electriccomponentsshop.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductsImport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String p_code;
    private String p_name;
    private int quantity;
    //don gia
    private BigDecimal original_price;
    //gia nhap vao
    private BigDecimal import_price;
    //giam gia
    private BigDecimal discount_price;
    //Thanh tien
    private BigDecimal total;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Inventory_id")
    @JsonIgnore
    private Inventory inventory;
}
