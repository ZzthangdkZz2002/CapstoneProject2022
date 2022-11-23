package com.example.electriccomponentsshop.repositories;

import com.example.electriccomponentsshop.entities.ProductLocation;
import com.example.electriccomponentsshop.entities.Warehouse;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ProductLocationRepository extends JpaRepository<ProductLocation, Integer> {
    ProductLocation findProductLocationByName(String name);
    List<ProductLocation> findProductLocationByWarehouse(Warehouse warehouse);
    ProductLocation findProductLocationByWarehouseAndName(Warehouse warehouse, String name);

    @Override
    Optional<ProductLocation> findById(Integer integer);
}
