package com.example.electriccomponentsshop.services;

import com.example.electriccomponentsshop.dto.ExportTransactionNewDTO;

public interface ExportTransactionNewService {
    void addExportTransaction(ExportTransactionNewDTO exportTransactionNewDTO) throws Exception;
}
