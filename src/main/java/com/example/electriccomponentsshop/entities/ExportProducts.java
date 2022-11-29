package com.example.electriccomponentsshop.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;


@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class ExportProducts {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id")
    @JsonIgnore
    private Product product;

//    vi tri xuat kho cua san pham
//    private String location_id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "location_id")
    @JsonIgnore
    private ProductLocation productLocation;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "export_id")
    @JsonIgnore
    private ExportTransactionNew exportTransactionNew;

    //so luong xuat kho cua this product
    private int quantity;
}
