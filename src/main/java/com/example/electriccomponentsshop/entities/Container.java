package com.example.electriccomponentsshop.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name="Container")
public class Container {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column
    private String shelf;
    @Column
    private Integer rowIn;
    @Column
    private Integer columnIn;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="warehouse_id")
    @JsonIgnore
    private Warehouse warehouse;
    @OneToMany(fetch = FetchType.LAZY,mappedBy = "container")
    List<ImportItem> importItems = new ArrayList<>();

}
