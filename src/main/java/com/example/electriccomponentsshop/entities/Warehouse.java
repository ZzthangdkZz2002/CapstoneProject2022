package com.example.electriccomponentsshop.entities;

import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "Warehouse")
public class Warehouse {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column
    private String name;
    @Column
    private Integer storeId;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "pCode")
    private Province provinceWarehouse;
//    @OneToMany(fetch = FetchType.LAZY,mappedBy = "warehouse")
//    private List<ProductWareHouse> productWareHouseList = new ArrayList<>();
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "dCode")
    private District districtWarehouse;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "wCode")
    private Ward wardWarehouse;
    @Column
    private String detailLocation;
    @Column
    private Integer status;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "warehouse")
    List<Container> containerList = new ArrayList<>();

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "warehouseImport")
    List<ImportTransaction> importTransactions = new ArrayList<>();

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "warehouse")
    List<Inventory> inventories = new ArrayList<>();

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "warehouse")
    List<ProductLocation> productLocations = new ArrayList<>();

//    @OneToMany(fetch = FetchType.LAZY, mappedBy = "warehouse")
//    List<InventoryExport> inventoryExports = new ArrayList<>();
}
