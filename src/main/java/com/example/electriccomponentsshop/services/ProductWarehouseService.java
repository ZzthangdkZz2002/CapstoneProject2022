package com.example.electriccomponentsshop.services;

import com.example.electriccomponentsshop.dto.ProductWarehouseDTO;
import com.example.electriccomponentsshop.entities.ProductWareHouse;
import org.springframework.stereotype.Service;

import java.util.List;


public interface ProductWarehouseService {
    List<ProductWarehouseDTO> addProductToWarehouse(ProductWarehouseDTO productWarehouseDTO);

}
