package com.example.electriccomponentsshop.entities;

import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
    private int total_quantity;
    //tong tien hang
    private BigDecimal total_importPrice;
    //tien da tra nha cung cap
    private BigDecimal money_paid;
    private String creator_name;
    private String note;
    private String receiver;
//    private Integer real_quantity;
//    private BigDecimal real_totalPrice;
//    private int difference_quantity;
//    private int difference_quantityUp;
//    private int difference_quantityDown;

//    private String product_code;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "warehouse_id")
    private Warehouse warehouse;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "supplier_id")
    private Supplier supplier;

    @OneToMany(fetch = FetchType.EAGER,mappedBy = "inventory")
    List<ProductsImport> productsImports = new ArrayList<>();
}
