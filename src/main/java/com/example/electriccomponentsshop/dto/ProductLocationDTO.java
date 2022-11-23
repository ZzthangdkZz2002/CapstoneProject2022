package com.example.electriccomponentsshop.dto;

import com.example.electriccomponentsshop.entities.Warehouse;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ProductLocationDTO {
    private String id;
    private String name;
    private Warehouse warehouse;
}
