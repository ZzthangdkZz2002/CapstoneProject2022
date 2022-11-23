package com.example.electriccomponentsshop.dto;

import com.example.electriccomponentsshop.entities.Product;
import com.example.electriccomponentsshop.entities.ProductLocation;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class ProductWarehouse2DTO {
    private Integer id;
    private Product product;
    private ProductLocation productLocation;
    private Long total;

    public ProductWarehouse2DTO(Integer id, Product product, ProductLocation productLocation,Long total) {
        this.id = id;
        this.product = product;
        this.productLocation = productLocation;
        this.total = total;
    }
}
