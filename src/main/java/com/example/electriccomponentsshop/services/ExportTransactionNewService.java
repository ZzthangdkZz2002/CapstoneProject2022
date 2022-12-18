package com.example.electriccomponentsshop.services;

import com.example.electriccomponentsshop.dto.ExportTransactionNewDTO;
import org.springframework.security.core.Authentication;

public interface ExportTransactionNewService {
    void addExportTransaction(ExportTransactionNewDTO exportTransactionNewDTO, Authentication authentication) throws Exception;
}
