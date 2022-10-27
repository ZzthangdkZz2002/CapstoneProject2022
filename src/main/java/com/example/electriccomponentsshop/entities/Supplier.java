package com.example.electriccomponentsshop.entities;

import lombok.*;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name="Supplier", uniqueConstraints = @UniqueConstraint(columnNames = {"name","phone"}))
public class Supplier {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column
    private String code;

    @Column
    private String name;
    private String phone;
    private String email;
    @Column
    String tax_code;
    @Column
    private String address;
    @Column
    private String company;
    @Column
    private String note;
    @Column
    private BigDecimal debt;
    @Column
    private BigDecimal total_purchase;

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "supplier")
    List<Inventory> inventories = new ArrayList<>();
//    @OneToMany(fetch = FetchType.LAZY,mappedBy = "productSupplier")
//    List<Product> products = new ArrayList<>();
    private Integer active;
}
