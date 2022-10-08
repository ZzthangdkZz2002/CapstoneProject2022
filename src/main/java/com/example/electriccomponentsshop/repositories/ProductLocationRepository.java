package com.example.electriccomponentsshop.repositories;

import com.example.electriccomponentsshop.entities.ProductLocation;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductLocationRepository extends JpaRepository<ProductLocation, Integer> {
    ProductLocation findProductLocationByName(String name);
}
