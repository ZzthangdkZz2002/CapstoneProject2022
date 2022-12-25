package com.example.electriccomponentsshop.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductLocation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    private String name;

    @OneToMany(mappedBy = "productLocation")
    private List<ProductWareHouse> productWareHouseList = new ArrayList<>();

    @OneToMany(mappedBy = "productLocation")
    private List<ExportProducts> exportProducts = new ArrayList<>();


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "warehouse_id")
    @JsonIgnore
    private Warehouse warehouse;

    public ProductLocation(Warehouse warehouse,String name){
        this.warehouse = warehouse;
        this.name = name;
    }
}
