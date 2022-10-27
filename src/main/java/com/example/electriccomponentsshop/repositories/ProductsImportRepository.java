package com.example.electriccomponentsshop.repositories;

import com.example.electriccomponentsshop.entities.Inventory;
import com.example.electriccomponentsshop.entities.ProductsImport;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ProductsImportRepository extends JpaRepository<ProductsImport, Integer> {
    List<ProductsImport> findByInventory(Inventory inventory);
}
