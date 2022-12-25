package com.example.electriccomponentsshop.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductWareHouse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

//    @ManyToOne(fetch = FetchType.EAGER)
//    @JoinColumn(name = "location_id")
//    @JsonIgnore
//    private ProductLocation productLocation;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "product_id")
    @JsonIgnore
    private Product product;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "location_id")
    @JsonIgnore
    private ProductLocation productLocation;

//    @ManyToOne(fetch = FetchType.EAGER)
//    @JoinColumn(name = "warehouse_id")
//    @JsonIgnore
//    private Warehouse warehouse;

    @Column()
    private Integer quantity;

    public ProductWareHouse(ProductLocation productLocation, Integer quantity){
        this.productLocation = productLocation;
        this.quantity = quantity;
    }
}
