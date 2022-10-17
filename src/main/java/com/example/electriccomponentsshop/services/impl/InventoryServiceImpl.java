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
import java.util.List;

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
    @Override
    public boolean addInventoryImport(ProductWarehouseDTO productWarehouseDTO) {
        try{
            for(ImportProductDTO p : productWarehouseDTO.getImportProducts()){
                if(productRepository.findByCode(p.getProduct_code()).isPresent()){
                    Inventory inventory = new Inventory();
                    int quantity = getProductQuantity(productWarehouseDTO.getWarehouse(),p.getProduct_code());
                    inventory.setProduct_code(p.getProduct_code());
                    inventory.setWarehouse(productWarehouseDTO.getWarehouse());
                    if(Integer.parseInt(productWarehouseDTO.getSupplier_id()) > 0 && supplierRepository.findById(Integer.parseInt(productWarehouseDTO.getSupplier_id())).isPresent()){
                        inventory.setSupplier(supplierRepository.findById(Integer.parseInt(productWarehouseDTO.getSupplier_id())).get());
                    }
                    inventory.setReal_quantity(quantity);
                    inventory.setCreator_name(getLoggedUsername());
                    inventory.setDifference_quantity(p.getQuantity());
                    inventory.setDifference_quantityUp(p.getQuantity());
                    inventory.setDifference_quantityDown(0);
                    int realTotalPrice = productRepository.findByCode(p.getProduct_code()).get().getOriginal_price().intValue() * quantity;
                    inventory.setReal_totalPrice(new BigDecimal(realTotalPrice));
                    inventory.setMoney_mustPay(BigDecimal.valueOf(p.getImport_pirce().doubleValue() * p.getQuantity()));
                    inventory.setNote("Phiếu kiểm kho được tạo tự động khi thêm hàng hóa vào kho:"+p.getProduct_code());
                    inventoryRepository.save(inventory);
                    inventory.setCode(new Utils().generateInventoryCode(inventoryRepository.getMaxProductID()));
                    inventoryRepository.save(inventory);

                }
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
