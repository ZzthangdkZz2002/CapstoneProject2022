package com.example.electriccomponentsshop.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import javax.persistence.Column;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ProductExportLocationDTO {
    private Integer id;
    private ProductLocationDTO productLocationDTO;
    private int quantity;
}
