package com.example.electriccomponentsshop.services.impl;



import com.example.electriccomponentsshop.common.Utils;
import com.example.electriccomponentsshop.config.ModelMap;
import com.example.electriccomponentsshop.dto.ProductWarehouseDTO;
import com.example.electriccomponentsshop.dto.SupplierDTO;
import com.example.electriccomponentsshop.entities.Inventory;
import com.example.electriccomponentsshop.entities.Supplier;
import com.example.electriccomponentsshop.repositories.InventoryRepository;
import com.example.electriccomponentsshop.repositories.SupplierRepository;
import com.example.electriccomponentsshop.services.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.math.BigDecimal;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class SupplierServiceImpl implements SupplierService {
    @Autowired
    SupplierRepository supplierRepository;
    @Autowired
    InventoryRepository inventoryRepository;
    @Autowired
    ModelMap modelMap;
    @Override
    public List<Supplier> findAll() {
        return supplierRepository.findAll();
    }

    @Override
    public <S extends Supplier> S save(S entity) {
        return supplierRepository.save(entity);
    }
    @Override
    public SupplierDTO convertToDto(Supplier supplier){
        return modelMap.modelMapper().map(supplier,SupplierDTO.class);
    }

    @Override
    public void addDebtAndPurchaseToSupplier(ProductWarehouseDTO productWarehouseDTO) {
        if(productWarehouseDTO.getSupplier_id() != null || Integer.parseInt(productWarehouseDTO.getSupplier_id()) > 0){
            Supplier supplier = getBySupplierId(productWarehouseDTO.getSupplier_id());
            supplier.setDebt(BigDecimal.valueOf((productWarehouseDTO.getTotal_importPrice().doubleValue() - productWarehouseDTO.getMoney_paid().doubleValue()) + supplier.getDebt().doubleValue()));

            List<Inventory> inventories = inventoryRepository.findInventoryBySupplier(supplier);
            double total_purchase = 0;
            if(inventories != null){
                for(Inventory inventory : inventories){
                    total_purchase += inventory.getTotal_importPrice().doubleValue();
                }
            }
            supplier.setTotal_purchase(BigDecimal.valueOf(total_purchase));
            supplierRepository.save(supplier);
        }
    }

    @Override
    public Supplier getBySupplierId(String id){
        try{
            int sId = Integer.parseInt(id);
            Optional<Supplier> supplier = supplierRepository.findById(sId);
            if(supplier.isPresent()){
                return supplier.get();
            }else throw new NoSuchElementException("Không tìm thấy nhà cung cấp này");
        }catch (NumberFormatException e){
            throw  new NoSuchElementException("Không tìm nhà cung cấp này");
        }
    }
   @Override
   public SupplierDTO getDtoById(String id){
        return convertToDto(getBySupplierId(id));
   }
    @Override
    public List<Supplier> getAllSupplier(){
        List<Supplier> supplierList = supplierRepository.findAll();
        if(supplierList.isEmpty()){
            throw new NoSuchElementException("Không tìm thấy nhà cung cấp");
        }
        return supplierList;
    }
    @Override
    public Optional<Supplier> findById(Integer integer) {
        return supplierRepository.findById(integer);
    }
    @Override
    public String addSupplier(SupplierDTO supplierDTO){
        Supplier supplier = new Supplier();
        supplier.setName(supplierDTO.getName());
        supplier.setPhone(supplierDTO.getPhone());
        supplier.setEmail(supplierDTO.getEmail());
        supplier.setCompany(supplierDTO.getCompany());
        supplier.setAddress(supplierDTO.getAddress());
        supplier.setNote(supplierDTO.getNote());
        supplier.setTax_code(supplierDTO.getTax_code());
        supplier.setDebt(BigDecimal.valueOf(0));
        supplier.setTotal_purchase(BigDecimal.valueOf(0));
        supplier.setActive(1);
        String code = "";
        if("".equals(supplierDTO.getCode()) || supplierDTO.getCode() == null){
            code += new Utils().generateSupplierCode(supplierRepository.getMaxSupplierID()+1);
        }else{
            code += supplierDTO.getCode();
        }

        if(supplierRepository.findByCode(code).isPresent()){
            return "01";
        }else{
            supplier.setCode(code);
            supplierRepository.save(supplier);
            return "00";
        }

    }
    @Override
    public void updateSupplier(SupplierDTO supplierDTO,String id){
        Supplier supplier = getBySupplierId(id);
        supplier.setName(supplierDTO.getName());
        supplier.setPhone(supplierDTO.getPhone());
        supplierRepository.save(supplier);
    }
    @Override
    public void disableSupplier(String id){
        Supplier supplier = getBySupplierId(id);
        supplier.setActive(0);
        supplierRepository.save(supplier);
    }
    @Override
    public void enableSupplier(String id){
        Supplier supplier = getBySupplierId(id);
        supplier.setActive(1);
        supplierRepository.save(supplier);
    }
}
