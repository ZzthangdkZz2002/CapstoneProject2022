package com.example.electriccomponentsshop.repositories;

import com.example.electriccomponentsshop.dto.ProductWarehouse2DTO;
import com.example.electriccomponentsshop.entities.Product;
import com.example.electriccomponentsshop.entities.ProductLocation;
import com.example.electriccomponentsshop.entities.ProductWareHouse;
import com.example.electriccomponentsshop.entities.Warehouse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductWarehouseRepository extends JpaRepository<ProductWareHouse, Integer> {
    List<ProductWareHouse> findProductWareHouseByProductLocationAndProduct(ProductLocation productLocation, Product product);
    List<ProductWareHouse> findProductWareHouseByProduct(Product product);
    @Query(value = "select distinct pl.warehouse_id FROM product_ware_house pw join product_location pl on pw.location_id = pl.id where pw.product_id = :p_id and pw.quantity > 0", nativeQuery = true)
    List<String> findWarehouseByProductId(Integer p_id);

    @Query(value = "SELECT new com.example.electriccomponentsshop.dto.ProductWarehouse2DTO(pw.id, pw.product, pw.productLocation, sum(pw.quantity)) from ProductWareHouse pw "+
    "GROUP BY pw.product.id, pw.productLocation.id having pw.product.id = :p_id and sum(pw.quantity) > 0")
    List<ProductWarehouse2DTO> findLocationByProductId(Integer p_id);

    @Query(value = "select SUM(quantity) as total from product_ware_house where product_id = :p_id and location_id = :l_id", nativeQuery = true)
    int findProductQuantity(int p_id, int l_id);
////    List<ProductWareHouse> findProductWareHouseByWarehouse(Warehouse warehouse);
//    List<ProductWareHouse> findProductWareHouseByWarehouseAndProduct(Warehouse warehouse,Product product);
}
