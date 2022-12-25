package com.example.electriccomponentsshop.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class PaymentDTO {
    private int amount;
    private String desc;
    private String bankCode;
}
