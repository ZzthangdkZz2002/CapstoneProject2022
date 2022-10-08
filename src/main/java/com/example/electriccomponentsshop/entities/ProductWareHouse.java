package com.example.electriccomponentsshop.entities;

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

    @ManyToOne
    @JoinColumn(name = "location_id")
    private ProductLocation productLocation;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "warehouse_id")
    private Warehouse warehouse;

    @Column()
    private Integer quantity;

    public ProductWareHouse(ProductLocation productLocation, Warehouse warehouse){
        this.productLocation = productLocation;
        this.warehouse = warehouse;
    }
}
