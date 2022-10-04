//package com.example.electriccomponentsshop.entities;
//
//import lombok.AllArgsConstructor;
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//
//import javax.persistence.*;
//
//@Getter
//@Setter
//@Entity
//@NoArgsConstructor
//@AllArgsConstructor
//public class ProductWarehouse {
//
//    @EmbeddedId
//    ProductWarehouseKey id;
//
//    @ManyToOne
//    @MapsId("productId")
//    @JoinColumn(name = "product_id")
//    Product product;
//
//    @ManyToOne
//    @MapsId("warehouseId")
//    @JoinColumn(name = "warehouse_id")
//    Warehouse warehouse;
//
//    int quantity;
//
//
//
//}
