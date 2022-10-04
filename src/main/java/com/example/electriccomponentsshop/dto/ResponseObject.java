package com.example.electriccomponentsshop.dto;

import lombok.*;

@AllArgsConstructor
@Getter
@Setter
@NoArgsConstructor
@ToString
public class ResponseObject {
    private String status;
    private String message;
    private Object data;
}
