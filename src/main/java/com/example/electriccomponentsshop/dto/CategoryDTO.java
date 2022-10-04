package com.example.electriccomponentsshop.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryDTO {
    private Integer id;
//    private String parentId;
//    private String parentName;
    private String name;

}
