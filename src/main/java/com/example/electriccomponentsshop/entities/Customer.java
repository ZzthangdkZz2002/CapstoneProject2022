package com.example.electriccomponentsshop.entities;

import lombok.*;
import org.hibernate.annotations.ColumnDefault;

import javax.persistence.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class Customer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    @Column(unique = true)
    private String phone;
    private String email;
    private String address;
    private String province;
    private String district;
    private String ward;
    private String note;
    private Date dob;
    private String gender;
    @Column
    @ColumnDefault("0")
    private int totalPaid;
    @OneToMany(mappedBy = "customer",fetch = FetchType.EAGER)
    private List<OrderTransaction> orderTransactions = new ArrayList<>();

}
