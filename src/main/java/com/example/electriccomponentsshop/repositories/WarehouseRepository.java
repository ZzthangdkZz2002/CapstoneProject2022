package com.example.electriccomponentsshop.repositories;

import com.example.electriccomponentsshop.entities.Warehouse;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface WarehouseRepository extends JpaRepository<Warehouse,Integer> {
    Warehouse findWarehouseById(Integer id);
    List<Warehouse> findWarehouseByStatus(int status);
}
