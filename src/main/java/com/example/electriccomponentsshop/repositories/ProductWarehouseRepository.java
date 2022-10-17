package com.example.electriccomponentsshop.repositories;

import com.example.electriccomponentsshop.entities.Product;
import com.example.electriccomponentsshop.entities.ProductLocation;
import com.example.electriccomponentsshop.entities.ProductWareHouse;
import com.example.electriccomponentsshop.entities.Warehouse;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductWarehouseRepository extends JpaRepository<ProductWareHouse, Integer> {
    List<ProductWareHouse> findProductWareHouseByProductLocationAndProduct(ProductLocation productLocation, Product product);
    List<ProductWareHouse> findProductWareHouseByProduct(Product product);
////    List<ProductWareHouse> findProductWareHouseByWarehouse(Warehouse warehouse);
//    List<ProductWareHouse> findProductWareHouseByWarehouseAndProduct(Warehouse warehouse,Product product);
}
