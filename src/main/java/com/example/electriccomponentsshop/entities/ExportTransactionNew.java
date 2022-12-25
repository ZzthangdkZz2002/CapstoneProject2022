package com.example.electriccomponentsshop.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class ExportTransactionNew {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    @CreationTimestamp
    private Date created_date;

    private String transaction_code;

    @OneToOne(optional = true)
    @JoinColumn(name="order_id")
    private OrderTransaction orderTransaction;

    @OneToMany(mappedBy = "exportTransactionNew",fetch = FetchType.EAGER)
    private Set<ExportProducts> exportProducts = new HashSet<>();

    private String exportPerson;
    private String receivedPerson;
    private String description;
}
