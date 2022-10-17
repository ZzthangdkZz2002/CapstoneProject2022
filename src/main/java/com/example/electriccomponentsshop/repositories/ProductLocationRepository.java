package com.example.electriccomponentsshop.repositories;

import com.example.electriccomponentsshop.entities.ProductLocation;
import com.example.electriccomponentsshop.entities.Warehouse;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductLocationRepository extends JpaRepository<ProductLocation, Integer> {
    ProductLocation findProductLocationByName(String name);
    List<ProductLocation> findProductLocationByWarehouse(Warehouse warehouse);
    ProductLocation findProductLocationByWarehouseAndName(Warehouse warehouse, String name);
}
