package com.example.electriccomponentsshop.dto;

import com.example.electriccomponentsshop.entities.ExportProducts;
import com.example.electriccomponentsshop.entities.OrderTransaction;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ExportTransactionNewDTO {

    private String id;
    private String created_date;
    private String transaction_code;
    private String order_id;
    private List<ExportProductsDTO> exportProducts;
    private String exportPerson;
    private String receivedPerson;
    private String description;
}
