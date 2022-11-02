package com.example.electriccomponentsshop.services.impl;

import com.example.electriccomponentsshop.common.JwtUtils;
import com.example.electriccomponentsshop.common.Utils;
import com.example.electriccomponentsshop.dto.ImportProductDTO;
import com.example.electriccomponentsshop.dto.ProductWarehouseDTO;
import com.example.electriccomponentsshop.entities.*;
import com.example.electriccomponentsshop.repositories.*;
import com.example.electriccomponentsshop.services.InventoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class InventoryServiceImpl implements InventoryService {
    @Autowired
    private JwtUtils jwtUtils;
    @Autowired
    ProductRepository productRepository;
    @Autowired
    ProductWarehouseRepository productWarehouseRepository;
    @Autowired
    InventoryRepository inventoryRepository;
    @Autowired
    ProductLocationRepository productLocationRepository;
    @Autowired
    SupplierRepository supplierRepository;
    @Autowired
    ProductsImportRepository productsImportRepository;
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
            inventory.setNote("note test");
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
