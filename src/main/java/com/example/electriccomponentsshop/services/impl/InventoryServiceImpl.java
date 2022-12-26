package com.example.electriccomponentsshop.services.impl;

import com.example.electriccomponentsshop.common.JwtUtils;
import com.example.electriccomponentsshop.common.Utils;
import com.example.electriccomponentsshop.dto.*;
import com.example.electriccomponentsshop.entities.*;
import com.example.electriccomponentsshop.repositories.*;
import com.example.electriccomponentsshop.services.InventoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.*;

@Service
public class InventoryServiceImpl implements InventoryService {
    @Autowired private JwtUtils jwtUtils;
    @Autowired ProductRepository productRepository;
    @Autowired ProductWarehouseRepository productWarehouseRepository;
    @Autowired InventoryRepository inventoryRepository;
    @Autowired ProductLocationRepository productLocationRepository;
    @Autowired SupplierRepository supplierRepository;
    @Autowired ProductsImportRepository productsImportRepository;
    @Autowired OrderTransactionRepository orderTransactionRepository;
    @Autowired InventoryExportRepository inventoryExportRepository;
    @Autowired ProductExportLocationRepository productExportLocationRepository;
    @Autowired ProductsExportRepository productsExportRepository;


    @Override
    public void addInventoryExport(ExportTransactionNewDTO exportTransactionNewDTO) {
        try{
            InventoryExport inventoryExport = new InventoryExport();
            Set<ProductsExport> productsExports = new HashSet<>();
            String location_id = "";
            OrderTransaction orderTransaction = orderTransactionRepository.findByOrderid(exportTransactionNewDTO.getOrder_id()).get();
            inventoryExport.setExporter_name(exportTransactionNewDTO.getExportPerson());
            inventoryExport.setReceiver(exportTransactionNewDTO.getReceivedPerson());
            inventoryExport.setNote(exportTransactionNewDTO.getDescription());

            int total_exportPrice = 0;
            for(ExportProductsDTO ep : exportTransactionNewDTO.getExportProducts()){
                Product product = productRepository.findById(Integer.parseInt(ep.getProduct_id())).get();
                for(ProductWarehouseExportDTO pwe : ep.getProductWarehouseExportDTOS()){
                    total_exportPrice += product.getOriginal_price().doubleValue() * pwe.getQuantity();
                }
            }

            inventoryExport.setTotal_exportPrice(total_exportPrice);
            inventoryExport.setOrderTransaction(orderTransaction);

            InventoryExport iv1 = inventoryExportRepository.save(inventoryExport);
            inventoryExport.setCode(new Utils().generateInventoryExportCode(iv1.getId()));
            InventoryExport iv2 = inventoryExportRepository.save(inventoryExport);
            for(ExportProductsDTO ep : exportTransactionNewDTO.getExportProducts()){
                ProductsExport pe = new ProductsExport();
                Set<ProductExportLocation> productExportLocationList = new HashSet<>();
                Product product = productRepository.findById(Integer.parseInt(ep.getProduct_id())).get();
                pe.setP_code(product.getCode());
                pe.setP_name(product.getName());
                pe.setPrice(product.getOriginal_price().doubleValue());
                pe.setInventoryExport(iv2);
                ProductsExport pe1 = productsExportRepository.save(pe);
                for(ProductWarehouseExportDTO pwe : ep.getProductWarehouseExportDTOS()){
                    ProductExportLocation pel = new ProductExportLocation();
                    pel.setQuantity(pwe.getQuantity());
                    pel.setLocation_id(pwe.getLocation_id());
                    pel.setProductsExport(pe1);
                    productExportLocationRepository.save(pel);
                    productExportLocationList.add(pel);
                }
                pe.setProductExportLocationList(productExportLocationList);
                productsExports.add(pe);
                productsExportRepository.save(pe);
            }
            inventoryExport.setProductsExports(productsExports);
            inventoryExportRepository.save(inventoryExport);


        }catch (Exception e){
            System.out.println("Inventory exprot error: " + e.getMessage());
        }
    }

    @Override
    public boolean addInventoryImport(ProductWarehouseDTO productWarehouseDTO) {
        try{
            Inventory inventory = new Inventory();
            List<ProductsImport> productsImports = new ArrayList<>();
            int total_quantity=0;

            for(ImportProductDTO p : productWarehouseDTO.getImportProducts()){
                total_quantity += p.getQuantity();
            }
            inventory.setProductsImports(productsImports);
            inventory.setTotal_quantity(total_quantity);
            inventory.setTotal_importPrice(productWarehouseDTO.getTotal_importPrice());
            inventory.setMoney_paid(productWarehouseDTO.getMoney_paid());
            inventory.setCreator_name(getLoggedUsername());
            inventory.setNote(productWarehouseDTO.getNote());
            inventory.setWarehouse(productWarehouseDTO.getWarehouse());
            if(Integer.parseInt(productWarehouseDTO.getSupplier_id()) > 0 && supplierRepository.findById(Integer.parseInt(productWarehouseDTO.getSupplier_id())).isPresent()){
                inventory.setSupplier(supplierRepository.findById(Integer.parseInt(productWarehouseDTO.getSupplier_id())).get());
            }
            inventoryRepository.save(inventory);
            inventory.setCode(new Utils().generateInventoryCode(inventoryRepository.getMaxProductID()));
            Inventory in = inventoryRepository.save(inventory);


            for(ImportProductDTO p : productWarehouseDTO.getImportProducts()){

                ProductsImport productsImport = new ProductsImport();
                productsImport.setP_code(p.getProduct_code());
                Optional<Product> pr = productRepository.findByCode(p.getProduct_code());
                if(pr.isPresent()){
                    productsImport.setP_name(pr.get().getName());
                }
                productsImport.setQuantity(p.getQuantity());
                productsImport.setOriginal_price(p.getOriginal_price());
                double discount = p.getDiscount_price().doubleValue() > p.getOriginal_price().doubleValue() ? p.getOriginal_price().doubleValue() : p.getDiscount_price().doubleValue();
                productsImport.setImport_price(BigDecimal.valueOf(p.getOriginal_price().doubleValue() - discount));
                productsImport.setDiscount_price(BigDecimal.valueOf(discount));
                productsImport.setTotal(p.getTotal());
                productsImport.setInventory(in);
                productsImportRepository.save(productsImport);
//                inventory.getProductsImports().add(productsImport);
                productsImports.add(productsImport);
            }
            return true;

        }catch (Exception e){
            System.out.println("inventory error: "+e.getMessage());
            return false;
        }
    }

    @Override
    public String getLoggedUsername() {
        return jwtUtils.getEmailFromJwtToken(JwtUtils.token);
//        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//        if(principal instanceof UserDetails){
//            return ((UserDetails)principal).getUsername();
//        }else{
//            return principal.toString();
//        }
    }

    public int getProductQuantity(Warehouse warehouse, String p_code){
        int quantity = 0;
        Product product = productRepository.findByCode(p_code).get();
        List<ProductLocation> productLocations = productLocationRepository.findProductLocationByWarehouse(warehouse);
        for(ProductLocation pl : productLocations){

            List<ProductWareHouse> productWareHouses = productWarehouseRepository.findProductWareHouseByProductLocationAndProduct(pl, product);

            for(ProductWareHouse pw: productWareHouses){
                quantity += pw.getQuantity();
            }
//            if(productWareHouse != null){
//                quantity += productWareHouse.getQuantity();
//            }
        }
//        List<ProductWareHouse> productWareHouses = productWarehouseRepository.findProductWareHouseByWarehouseAndProduct(warehouse, product);
//        for(ProductWareHouse p : productWareHouses){
//            quantity += p.getQuantity();
//        }
        System.out.println("quantity: "+quantity);
        return quantity;
    }



}
