package com.example.electriccomponentsshop.dto;


import com.example.electriccomponentsshop.entities.ProductLocation;
import com.example.electriccomponentsshop.entities.Supplier;
import com.example.electriccomponentsshop.entities.Warehouse;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductWarehouseDTO {
    @NotNull(message = "location is null")
    private String location_name;
    private Warehouse warehouse;
    private String supplier_id;
    //tong tien hang
    private BigDecimal total_importPrice;
    //tien da tra nha cung cap
    private BigDecimal money_paid;
    @NotNull
    private List<ImportProductDTO> importProducts;
}
