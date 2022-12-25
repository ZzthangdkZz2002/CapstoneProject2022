package com.example.electriccomponentsshop.services;

import com.example.electriccomponentsshop.dto.ExportTransactionNewDTO;
import com.example.electriccomponentsshop.dto.ProductWarehouseDTO;

public interface InventoryService {
    boolean addInventoryImport(ProductWarehouseDTO productWarehouseDTO);
    void addInventoryExport(ExportTransactionNewDTO exportTransactionNewDTO);
    String getLoggedUsername();
}
