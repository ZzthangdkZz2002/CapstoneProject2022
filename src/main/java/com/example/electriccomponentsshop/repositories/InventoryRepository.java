package com.example.electriccomponentsshop.repositories;

import com.example.electriccomponentsshop.entities.Inventory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface InventoryRepository extends JpaRepository<Inventory, Integer> {
    @Query(value = "select max(ID) from e2c.inventory",nativeQuery = true)
    Integer getMaxProductID();

    Optional<Inventory> findById(Integer id);
}
