package com.example.electriccomponentsshop.dto;

import com.example.electriccomponentsshop.entities.ProductExportLocation;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ProductsExportDTO {
    private Integer id;
    private String p_code;
    private String p_name;
    private Set<ProductExportLocationDTO> productExportLocationDTOS;
    private double price;
}
