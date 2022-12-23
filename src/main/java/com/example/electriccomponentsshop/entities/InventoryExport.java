package com.example.electriccomponentsshop.entities;

import lombok.*;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class InventoryExport {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String code;
    @CreationTimestamp
    @Column(updatable = false)
    private Date created_date;
    //tong so luong hang duoc xuat kho
//    private int total_quantity;
    //tong tien hang xuat kho
    @Column
    @ColumnDefault("0")
    private int total_exportPrice;
    private String exporter_name;
    private String receiver;
    private String note;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "transaction_id")
    private OrderTransaction orderTransaction;

//    @ManyToOne(fetch = FetchType.EAGER)
//    @JoinColumn(name = "warehouse_id")
//    private Warehouse warehouse;

    @OneToMany(fetch = FetchType.EAGER,mappedBy = "inventoryExport")
    Set<ProductsExport> productsExports = new HashSet<>();

}
