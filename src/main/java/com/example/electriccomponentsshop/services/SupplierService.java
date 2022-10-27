package com.example.electriccomponentsshop.services;

import com.example.electriccomponentsshop.dto.ProductWarehouseDTO;
import com.example.electriccomponentsshop.dto.SupplierDTO;
import com.example.electriccomponentsshop.entities.Supplier;


import java.util.List;
import java.util.Optional;

public interface SupplierService {
    List<Supplier> findAll();

    <S extends Supplier> S save(S entity);

    SupplierDTO convertToDto(Supplier supplier);

    void addDebtAndPurchaseToSupplier(ProductWarehouseDTO productWarehouseDTO);

    Supplier getBySupplierId(String id);

    SupplierDTO getDtoById(String id);

    List<Supplier> getAllSupplier();

    Optional<Supplier> findById(Integer integer);

    void addSupplier(SupplierDTO supplierDTO);

    void updateSupplier(SupplierDTO supplierDTO,String id);

    void disableSupplier(String id);

    void enableSupplier(String id);
}
