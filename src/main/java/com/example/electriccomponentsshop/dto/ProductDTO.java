package com.example.electriccomponentsshop.dto;

import com.example.electriccomponentsshop.entities.Brand;
import com.example.electriccomponentsshop.entities.Category;
import com.example.electriccomponentsshop.entities.SpecificationValue;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.data.annotation.Transient;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ProductDTO {
    private Integer id;
    @NotNull
    private String name;

    private String image;

    private String unit;

//    private MultipartFile image;
//    private BigInteger available;

    private BigDecimal original_price;
    
    private BigDecimal price;
    private int quantity;
    @NotNull
    private List<Category> categories;
    @NotNull
    private Brand brand;

    private String code;
//    private List<SpecificationValueDto> specificationValues;

    private int status;

    private String description;

    private Date addedDate;
//    private String supplierId;
//    private BigInteger unit;
}
