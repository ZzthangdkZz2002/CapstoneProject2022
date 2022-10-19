package com.example.electriccomponentsshop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import java.math.BigDecimal;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ImportProductDTO {
    @NotBlank
    private String product_code;

    private Integer quantity;

    //don gia
    private BigDecimal original_price;
//    gia nhap vao
//    private BigDecimal import_price;
    //giam gia
    private BigDecimal discount_price;
    //Thanh tien
    private BigDecimal total;
}
