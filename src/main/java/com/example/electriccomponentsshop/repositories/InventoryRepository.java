package com.example.electriccomponentsshop.repositories;

import com.example.electriccomponentsshop.entities.Inventory;
import com.example.electriccomponentsshop.entities.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface InventoryRepository extends JpaRepository<Inventory, Integer> {
    @Query(value = "select max(ID) from e2c.inventory",nativeQuery = true)
    Integer getMaxProductID();

    Optional<Inventory> findById(Integer id);

    List<Inventory> findInventoryBySupplier(Supplier supplier);

    @Query(value = "select * from e2c.inventory where supplier_id = :id order by created_date desc;",nativeQuery = true)
    List<Inventory> findInventoryBySupplierId(String id);

    @Query(value = "select * from e2c.inventory order by created_date desc",nativeQuery = true)
    List<Inventory> findInventoryByCreated_dateDesc();

    @Query(value = "select * from e2c.inventory where supplier_id = :sid and created_date between :from_date and :to_date order by created_date desc",nativeQuery = true)
    List<Inventory> findInventoryByCreated_dateAndSupplier(String from_date, String to_date, String sid);

    @Query(value = "select * from e2c.inventory where created_date between :from_date and :to_date order by created_date desc",nativeQuery = true)
    List<Inventory> findInventoryByCreated_date(String from_date, String to_date);

    @Query(value = "select * from e2c.inventory where code like %:code% order by created_date desc",nativeQuery = true)
    List<Inventory> findInventoryByCodeContaining(String code);

    @Query(value = "select * from e2c.inventory where code like %:code% and supplier_id = :sid order by created_date desc",nativeQuery = true)
    List<Inventory> findInventoryByCodeAndSupplier(String code, String sid);

}
