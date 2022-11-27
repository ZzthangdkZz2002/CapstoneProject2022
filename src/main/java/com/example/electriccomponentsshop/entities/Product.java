package com.example.electriccomponentsshop.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "Product")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private Integer id;
    @Column
    private String code;
    @Column
    private String name;
    @Column
    private String title;
    @Column(length = 250)
    private String image;
    @Column
    @ColumnDefault("0")
    private BigDecimal original_price;
    @Column
    @ColumnDefault("0")
    private BigDecimal price;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "brand_id")
    @JsonIgnore
    private Brand brand;


    @Column
    private String description;
    @CreationTimestamp
    @Column()
    private Date addedDate;

    @Column
    @ColumnDefault("0")
    private int quantity;

    @Column
    private int status;
    @Column
    private String unit;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "Product_Category", joinColumns = @JoinColumn(name = "product_id"), inverseJoinColumns = @JoinColumn(name = "category_id"))
    private List<Category> categories = new ArrayList<>();

//    @ManyToOne(fetch = FetchType.EAGER)
//    @JoinColumn(name = "cart_id")
//    private Cart cart;

//    @OneToOne(mappedBy = "product", cascade = CascadeType.ALL)
//    @PrimaryKeyJoinColumn
//    private ExportPrice exportPrice;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
    private List<Feedback> feedbackList = new ArrayList<>();

    @OneToMany(fetch = FetchType.LAZY,mappedBy = "product")
    private List<ProductWareHouse> productWareHouseList = new ArrayList<>();



//    @OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
//    private List<SpecificationValue> specificationValues = new ArrayList<>();

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
    private List<OrderItem> orderItems = new ArrayList<>();
//    @ManyToOne(fetch = FetchType.EAGER)
//    @JoinColumn(name = "supplier_id")
//    private Supplier productSupplier;
//    @OneToMany(fetch = FetchType.LAZY, mappedBy = "productImport")
//    private List<ImportItem> importItemsProduct = new ArrayList<>();
//    @OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
//    private List<Sku> skus = new ArrayList<>();
    public Product(Integer id, String name, String image, String description,int status){
        this.id = id;
        this.name=name;
        this.image=image;
        this.description =description;
        this.status =status;


    }
}
