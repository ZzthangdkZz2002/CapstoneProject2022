package com.example.electriccomponentsshop.services;

import com.example.electriccomponentsshop.dto.ProductWarehouseDTO;

public interface InventoryService {
    boolean addInventoryImport(ProductWarehouseDTO productWarehouseDTO);

    String getLoggedUsername();
}
