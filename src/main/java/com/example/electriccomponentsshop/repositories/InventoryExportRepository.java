package com.example.electriccomponentsshop.repositories;

import com.example.electriccomponentsshop.entities.Inventory;
import com.example.electriccomponentsshop.entities.InventoryExport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface InventoryExportRepository extends JpaRepository<InventoryExport, Integer> {
    @Query(value = "select * from e2c.inventory_export order by created_date desc",nativeQuery = true)
    List<InventoryExport> findbyCreatedDate();

    @Query(value = "select * from e2c.inventory_export where created_date between :from_date and :to_date order by created_date desc",nativeQuery = true)
    List<InventoryExport> findInventoryExportyByCreated_date(String from_date, String to_date);

    @Query(value = "select * from e2c.inventory_export where code like %:code% order by created_date desc",nativeQuery = true)
    List<InventoryExport> findInventoryExportByCodeContaining(String code);
}
