package com.example.electriccomponentsshop.repositories;


import com.example.electriccomponentsshop.entities.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface SupplierRepository extends JpaRepository<Supplier,Integer> {
    @Override
    List<Supplier> findAll();
    Optional<Supplier> findById(Integer id);
    Optional<Supplier> findByCode(String code);
    @Query(value = "select max(ID) from e2c.supplier",nativeQuery = true)
    Integer getMaxSupplierID();

    List<Supplier> findSupplierByActive(Integer active);

    @Override
    <S extends Supplier> S save(S entity);
}
