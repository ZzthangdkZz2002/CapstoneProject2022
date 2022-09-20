package com.example.electriccomponentsshop.entities;

import lombok.*;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Date;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class ExportPrice {
    @Id
    @Column(name = "product_id")
    private Integer id;
    @OneToOne
    @MapsId
    @JoinColumn(name = "product_id")
    private Product product;
    @Column
    private BigDecimal wholeSalePrice;
    @Column
    private BigDecimal retailPrice;
    @Column
    @UpdateTimestamp
    private Date updatedDate;

}