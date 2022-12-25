package com.example.electriccomponentsshop.dto;


import com.example.electriccomponentsshop.entities.ExportTransactionNew;
import com.example.electriccomponentsshop.entities.Product;
import com.example.electriccomponentsshop.entities.ProductLocation;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ExportProductsDTO {
    private String id;
    private String product_id;
    //1 san pham co the lay tu nhieu vi tri trong kho
    private List<ProductWarehouseExportDTO> productWarehouseExportDTOS;
    //so luong xuat kho cua this product
//    private int quantity;
}
