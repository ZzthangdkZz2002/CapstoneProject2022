package com.example.electriccomponentsshop.services.impl;

import com.example.electriccomponentsshop.common.Utils;
import com.example.electriccomponentsshop.config.ModelMap;
import com.example.electriccomponentsshop.dto.CategoryDTO;
import com.example.electriccomponentsshop.dto.ProductDTO;
import com.example.electriccomponentsshop.dto.SpecificationValueDto;
import com.example.electriccomponentsshop.entities.*;
import com.example.electriccomponentsshop.repositories.ExportPriceRepository;
import com.example.electriccomponentsshop.repositories.ProductRepository;
import com.example.electriccomponentsshop.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ProductServiceImpl implements ProductService {


    @Autowired
    ProductRepository productRepository;
//
//    @Autowired
//    SpecificationService specificationService;

//    @Autowired
//    SupplierService supplierService;


    EntityManager em;

    @Autowired
    ModelMap modelMap;

    CategoryService categoryService;

    @Value("${product.upload.path}")
    private String fileUpload;

    public ProductServiceImpl(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    private String sql = "select p.* from product p join product_category pc on pc.product_id = p.id "
            + " join category c on c.id = pc.category_id where status = 1 and path like :path " +
            " order by p.added_date desc, p.id desc";



    @Override
    public ProductDTO convertToDto(Product product) {
        return modelMap.modelMapper().map(product, ProductDTO.class);
    }

    @Override
    public ProductDTO getProductDtoById(String id){
        return convertToDto(getById(id));
    }
    @Override
    public Product getById(String id){
        try{
            Integer pId = Integer.parseInt(id);
            Optional<Product> productOptional = productRepository.findById(pId);
            if(productOptional.isEmpty()){
                throw new NoSuchElementException("Không tìm thấy sản phẩm có mã như vậy");
            }
            else return productOptional.get();
        } catch (NumberFormatException e){
            throw  new NoSuchElementException("Không có sản phẩm này");
        }
    }
//    public boolean updateProduct(ProductDTO productDTO, String id){
//       Product product = getById(id);
//       product.setName(productDTO.getName());
//       List<CategoryDTO> categoryDTOS = productDTO.getCategories();
//
//       List<Category> categories = new ArrayList<>();
//        for (CategoryDTO c: categoryDTOS
//             ) {
//
//            Category category = categoryService.getById(c.getId());
//            categories.add(category);
//        }
//        product.setCategories(categories);
//        Optional<ExportPrice> exportPriceOptional = exportPriceRepository.findByProductId(product.getId());
//        if(exportPriceOptional.isPresent()){
//            ExportPrice exportPrice = exportPriceOptional.get();
//            exportPriceRepository.save(exportPrice);
//        }
//        else {
//            ExportPrice newExportPrice = new ExportPrice();
//            newExportPrice.setProduct(product);
//            newExportPrice.setRetailPrice(productDTO.getPrice());
//            exportPriceRepository.save(newExportPrice);
//        }
//        List<SpecificationValueDto> specificationValueDtos = productDTO.getSpecificationValues();
//        List<SpecificationValue> specificationValues = new ArrayList<>();
//        for (SpecificationValueDto s: specificationValueDtos
//             ) {
//
//            Specification specification = specificationService.getById(s.getSpecificationId());
//            SpecificationValue specificationValue = new SpecificationValue(new SpecificationValueId(product.getId(),specification.getId()),s.getValueFrom(),s.getValueTo(),product,specification);
//            specificationValues.add(specificationValue);
//            specificationValueService.save(specificationValue);
//        }
//        product.setStatus(1);
//        product.setSpecificationValues(specificationValues);
//        product.setDescription(productDTO.getDescription());
//      return  productRepository.save(product)!=null;
//
//    }
    @Override
    public String addProduct(ProductDTO productDTO, MultipartFile multipartFile) {
        Product product = new Product();
        product.setName(productDTO.getName());
        List<Category> categories = productDTO.getCategories();


        product.setCategories(categories);
        product.setOriginal_price(productDTO.getOriginal_price());
        product.setPrice(productDTO.getPrice());
        product.setBrand(productDTO.getBrand());

        //upload image
        String fileName = multipartFile.getOriginalFilename();
        try{
            FileCopyUtils.copy(multipartFile.getBytes(), new File(this.fileUpload + fileName));
        }catch (IOException e){
            e.printStackTrace();
        }
        product.setImage(fileName);

        //

        if("".equals(productDTO.getCode()) || productDTO.getCode() == null){
            String code = new Utils().generateProductCode(productRepository.getMaxProductID()+1);
            product.setCode(code);
        }else if(productRepository.findByCode(productDTO.getCode()).isPresent()){
            return "Mã sản phẩm này đã tồn tại";
        }else{
            product.setCode(productDTO.getCode());
        }

//        product = productRepository.save(product);


        product.setStatus(1);
//        product.setSpecificationValues(specificationValues);
        product.setDescription(productDTO.getDescription());
        productRepository.save(product);
        return  "Lưu sản phẩm thành công";

    }



    @Override
    public List<Product> getAll(){
        return productRepository.findAll();
    }
    @Override
    public void disableProduct(String id){
        Product product = getById(id);
        product.setStatus(0);
        productRepository.save(product);
    }
    @Override
    public void enableProduct(String id){
        Product product = getById(id);
        product.setStatus(1);
        productRepository.save(product);
    }
    @Override
    public Page<Product> searchProduct(String text, Pageable pageable){
        return productRepository.searchProductsByNameorCode(text,pageable);
    }
//    @Override
//    public Page<ProductDTO> findBySupplierId(Pageable pageable, String sId){
//        Supplier supplier = supplierService.getBySupplierId(sId);
//        return productRepository.findProductsByProductSupplierId(supplier.getId(),pageable).map(this::convertToDto);
//    }
//    @Override
//    public List<ProductDTO> findBySupplierIdAndNameContain(String sId, String text){
//        Supplier supplier = supplierService.getBySupplierId(sId);
//        return productRepository.findProductsByProductSupplierIdAndNameContains(supplier.getId(),text).stream().map(this::convertToDto).collect(Collectors.toList());
//    }
    @Override
    public List<ProductDTO> findAll() {
        List<Product> products = productRepository.findAll();
        if(products.isEmpty()){
            throw  new NoSuchElementException("Không có sản phẩm nào");
        }
        return products.stream().map(this::convertToDto).collect(Collectors.toList());
    }

    @Override
    public Page<Product> findAll(Pageable pageable) {
        Page<Product> productPages = productRepository.findAll(pageable);
//        Page<ProductDTO> dtoPage = productPages.map(this::convertToDto);
        return productPages;
    }

    @Override
    public <S extends Product> S save(S entity) {
        return productRepository.save(entity);
    }


}
