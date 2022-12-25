package com.example.electriccomponentsshop.services;

import com.example.electriccomponentsshop.dto.ProductDTO;
import com.example.electriccomponentsshop.dto.ProductWarehouseDTO;
import com.example.electriccomponentsshop.entities.Product;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

public interface ProductService {

    List<Product> getProductByCate(String cate, int pageNo, int pageSize);

    int countByCate(String cate);

    ProductDTO convertToDto(Product product);

    ProductDTO getProductDtoById(String id);

    Product getById(String id);

    String addProduct(ProductDTO productDTO, MultipartFile multipartFile);
    String updateProduct(ProductDTO productDTO, MultipartFile multipartFile);

    List<Product> getAll();

    void setProductQuantity(ProductWarehouseDTO productWarehouseDTO);

    void disableProduct(String id);

    void enableProduct(String id);

    Page<Product> searchProduct(String text, Pageable pageable);

//    Page<ProductDTO> findBySupplierId(Pageable pageable, String sId);
//
//    List<ProductDTO> findBySupplierIdAndNameContain(String sId, String text);

    List<ProductDTO> findAll();

    <S extends Product> S save(S entity);

    Page<Product> findAll(Pageable pageable);

}
