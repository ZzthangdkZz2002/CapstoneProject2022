package com.example.electriccomponentsshop.repositories;

import com.example.electriccomponentsshop.entities.Inventory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InventoryRepository extends JpaRepository<Inventory, Integer> {
}
