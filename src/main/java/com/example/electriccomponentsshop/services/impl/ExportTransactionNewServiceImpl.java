package com.example.electriccomponentsshop.services.impl;

import com.example.electriccomponentsshop.common.OrderEnum;
import com.example.electriccomponentsshop.dto.ExportProductsDTO;
import com.example.electriccomponentsshop.dto.ExportTransactionNewDTO;
import com.example.electriccomponentsshop.dto.ProductWarehouseExportDTO;
import com.example.electriccomponentsshop.entities.*;
import com.example.electriccomponentsshop.repositories.*;
import com.example.electriccomponentsshop.services.AccountDetailImpl;
import com.example.electriccomponentsshop.services.ExportTransactionNewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ExportTransactionNewServiceImpl implements ExportTransactionNewService {
    @Autowired
    OrderTransactionRepository orderTransactionRepository;
    @Autowired
    ProductRepository productRepository;
    @Autowired
    ProductLocationRepository productLocationRepository;
    @Autowired
    ExportProductsRepository exportProductsRepository;
    @Autowired
    ExportTransactionNewRepository exportTransactionNewRepository;
    @Autowired
    ProductWarehouseRepository productWarehouseRepository;
    @Autowired
    AccountRepository accountRepository;

    @Override
    public void addExportTransaction(ExportTransactionNewDTO exportTransactionNewDTO, Authentication authentication) throws Exception {
        ExportTransactionNew exportTransactionNew = new ExportTransactionNew();
        exportTransactionNew.setExportPerson(exportTransactionNewDTO.getExportPerson());
        exportTransactionNew.setReceivedPerson(exportTransactionNewDTO.getReceivedPerson());
        exportTransactionNew.setDescription(exportTransactionNewDTO.getDescription());

        ExportTransactionNew exportTransactionNew2 = exportTransactionNewRepository.save(exportTransactionNew);

        Set<ExportProducts> exportProductsList = new HashSet<>();
        for(ExportProductsDTO exportProductsDTO : exportTransactionNewDTO.getExportProducts()){
            ExportProducts exportProducts = new ExportProducts();
            exportProducts.setProduct(productRepository.findById(Integer.parseInt(exportProductsDTO.getProduct_id())).get());
            for(ProductWarehouseExportDTO pwDto : exportProductsDTO.getProductWarehouseExportDTOS()){
                exportProducts.setQuantity(pwDto.getQuantity());
                exportProducts.setProductLocation(productLocationRepository.findById(Integer.parseInt(pwDto.getLocation_id())).get());
                exportProducts.setExportTransactionNew(exportTransactionNew2);

                exportProductsList.add(exportProductsRepository.save(exportProducts));

                List<ProductWareHouse> productWareHouses = productWarehouseRepository.findProductWareHouseByProductLocationAndProduct(productLocationRepository.findById(Integer.parseInt(pwDto.getLocation_id())).get(), productRepository.findById(Integer.parseInt(exportProductsDTO.getProduct_id())).get());
                boolean isExport = false;
                for(ProductWareHouse pw : productWareHouses){
                    if(pw.getQuantity() >= pwDto.getQuantity()){
                        pw.setQuantity(pw.getQuantity() - pwDto.getQuantity());
                        productWarehouseRepository.save(pw);
                        isExport = true;
                        break;
                    }
                }

                if(!isExport){
                    int soluongcanxuat = pwDto.getQuantity();
                    int soluongdaxuat = 0;
                    for(ProductWareHouse pw : productWareHouses){
                        if(soluongdaxuat < soluongcanxuat){
                            if((soluongcanxuat - soluongdaxuat) < pw.getQuantity()){
                                int i = soluongcanxuat - soluongdaxuat;
                                soluongdaxuat += (soluongcanxuat - soluongdaxuat);
                                pw.setQuantity(pw.getQuantity() - i);
                                productWarehouseRepository.save(pw);
                            }else{
                                soluongdaxuat += pw.getQuantity();
                                pw.setQuantity(0);
                                productWarehouseRepository.save(pw);
                            }
                        }else{
                            break;
                        }
                    }
                }

                Product product = productRepository.findById(Integer.parseInt(exportProductsDTO.getProduct_id())).get();
                product.setQuantity(product.getQuantity() - pwDto.getQuantity());
            }
        }
        exportTransactionNew2.setExportProducts(exportProductsList);

        OrderTransaction orderTransaction = orderTransactionRepository.findByOrderid(exportTransactionNewDTO.getOrder_id()).get();
        orderTransaction.setStatus(OrderEnum.DELIVERY.getName());
        orderTransaction.setUpdatedDate(new Date());
        AccountDetailImpl accountDetail = (AccountDetailImpl) authentication.getPrincipal();
        Account account = accountRepository.findById(accountDetail.getId()).get();
        orderTransaction.setEmployeeProcessor(account);
        orderTransactionRepository.save(orderTransaction);
        exportTransactionNew.setOrderTransaction(orderTransactionRepository.findByOrderid(exportTransactionNewDTO.getOrder_id()).get());
        exportTransactionNewRepository.save(exportTransactionNew);

    }
}
