package com.example.electriccomponentsshop.services.impl;

import com.example.electriccomponentsshop.dto.ImportProductDTO;
import com.example.electriccomponentsshop.dto.ProductWarehouseDTO;
import com.example.electriccomponentsshop.entities.Product;
import com.example.electriccomponentsshop.entities.ProductLocation;
import com.example.electriccomponentsshop.entities.ProductWareHouse;
import com.example.electriccomponentsshop.entities.Warehouse;
import com.example.electriccomponentsshop.repositories.ProductLocationRepository;
import com.example.electriccomponentsshop.repositories.ProductRepository;
import com.example.electriccomponentsshop.repositories.ProductWarehouseRepository;
import com.example.electriccomponentsshop.services.ProductWarehouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
@Service
public class ProductWarehouseServiceImpl implements ProductWarehouseService {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    ProductWarehouseRepository productWarehouseRepository;
    @Autowired
    ProductLocationRepository productLocationRepository;

    @Override
    public List<ProductWarehouseDTO> addProductToWarehouse(ProductWarehouseDTO productWarehouseDTO) {
        List<ProductWarehouseDTO> productWareHouses = null;
        for(ImportProductDTO productDTO : productWarehouseDTO.getImportProducts()){
            if(productRepository.findByCode(productDTO.getProduct_code()).isPresent()){
                productWareHouses = new ArrayList<>();
                Product product = new Product();
                product = productRepository.findByCode(productDTO.getProduct_code()).get();
                ProductLocation productLocation = productLocationRepository.findProductLocationByWarehouseAndName(productWarehouseDTO.getWarehouse(), productWarehouseDTO.getLocation_name());
                ProductWareHouse productWareHouse = new ProductWareHouse();
                productWareHouse.setProduct(product);
                productWareHouse.setQuantity(productDTO.getQuantity());

                //dieu chinh gia von
                double discount = productDTO.getDiscount_price().doubleValue() > productDTO.getOriginal_price().doubleValue() ? productDTO.getOriginal_price().doubleValue() : productDTO.getDiscount_price().doubleValue();
                double original_price = (product.getOriginal_price().doubleValue() * getProductQuantity(productDTO.getProduct_code()) + (productDTO.getOriginal_price().doubleValue() - discount) * productDTO.getQuantity()) /
                        (getProductQuantity(productDTO.getProduct_code())+productDTO.getQuantity());
                    product.setOriginal_price(BigDecimal.valueOf(original_price));
                    productRepository.save(product);
                //
//                productWareHouse.setWarehouse(productWarehouseDTO.getWarehouse());
                productWareHouse.setProductLocation(productLocation);
                productWarehouseRepository.save(productWareHouse);
                productWareHouses.add(productWarehouseDTO);
            }

        }

        return productWareHouses;
    }

    public int getProductQuantity(String p_code){
        int quantity = 0;
        Product product = productRepository.findByCode(p_code).get();
        List<ProductWareHouse> productWareHouses = productWarehouseRepository.findProductWareHouseByProduct(product);
        for(ProductWareHouse pw : productWareHouses){
            quantity += pw.getQuantity();
        }

        System.out.println("quantity: "+quantity);
        return quantity;
    }
}
