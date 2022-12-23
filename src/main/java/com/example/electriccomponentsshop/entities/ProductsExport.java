package com.example.electriccomponentsshop.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.hibernate.annotations.ColumnDefault;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ProductsExport {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String p_code;
    private String p_name;

    @OneToMany(fetch = FetchType.EAGER,mappedBy = "productsExport")
    private Set<ProductExportLocation> productExportLocationList = new HashSet<>();
    @Column
    @ColumnDefault("0")
    private double price;
    @Column
    @ColumnDefault("0")
    private int total;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "inventoryexport_id")
    @JsonIgnore
    private InventoryExport inventoryExport;
}
