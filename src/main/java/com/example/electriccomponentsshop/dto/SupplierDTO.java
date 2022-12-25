package com.example.electriccomponentsshop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SupplierDTO {
    private String id;
    private String code;
    private String name;
    private String phone;
    private String email;
    private String company;
    private String address;
    private String tax_code;
    private String note;
    private List<ProductDTO> products;
    private Integer active;



}
