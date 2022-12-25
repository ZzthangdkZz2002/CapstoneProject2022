package com.example.electriccomponentsshop.repositories;

import com.example.electriccomponentsshop.entities.Brand;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BrandRepository extends JpaRepository<Brand,Integer> {

    Brand findBrandByName(String name);

}
