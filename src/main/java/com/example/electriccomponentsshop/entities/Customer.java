package com.example.electriccomponentsshop.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

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
    private String note;
    private Date dob;
    private String gender;
    @OneToMany(mappedBy = "customer",fetch = FetchType.EAGER)
    private List<OrderTransaction> orderTransactions = new ArrayList<>();

}
