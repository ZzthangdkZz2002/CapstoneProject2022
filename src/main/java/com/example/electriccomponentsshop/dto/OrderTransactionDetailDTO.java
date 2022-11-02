package com.example.electriccomponentsshop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderTransactionDetailDTO {
    private int quantity;
    private double amount;

    ProductDTO productDTO;

    private Integer product_id;
}
