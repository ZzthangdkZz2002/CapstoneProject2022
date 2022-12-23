package com.example.electriccomponentsshop.controller.admin;

import com.example.electriccomponentsshop.dto.*;
import com.example.electriccomponentsshop.entities.Brand;
import com.example.electriccomponentsshop.entities.Category;
import com.example.electriccomponentsshop.entities.Product;

import com.example.electriccomponentsshop.repositories.BrandRepository;
import com.example.electriccomponentsshop.repositories.ProductLocationRepository;
import com.example.electriccomponentsshop.repositories.ProductRepository;
import com.example.electriccomponentsshop.repositories.ProductWarehouseRepository;
import com.example.electriccomponentsshop.services.*;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Optional;

@AllArgsConstructor
@CrossOrigin
@Controller
@RequestMapping("admin/products")
public class ProductController {

    final
    ProductService productService;
    final CategoryService categoryService;
    final SpecificationService specificationService;
    final SkuService skuService;

    @Autowired
    final ProductRepository productRepository;

    @Autowired
    final ProductWarehouseRepository productWarehouseRepository;

    @Autowired
    final BrandRepository brandRepository;
    @Autowired
    final ProductLocationRepository productLocationRepository;
    @GetMapping("")
    public String viewAll(Model model,@RequestParam(name="index",defaultValue = "0") String index){
        Page<Product> products =  productRepository.findAllByAddedDateDesc(PageRequest.of(Integer.parseInt(index),10));
        model.addAttribute("products", products.getContent());
        model.addAttribute("total",products.getTotalPages());
        return "administrator/product-management";
    }

    @GetMapping("/view/{id}")
    public String viewById(ModelMap model,@PathVariable @Valid String id){
        try{
            Product productDTO = productRepository.findById(Integer.parseInt(id)).get();
            List<Category> categoryDtos = categoryService.findAll();
            List<Brand> brands = brandRepository.findAll();
            model.addAttribute("productDto",productDTO);
            model.addAttribute("brands",brands);
            model.addAttribute("listCategories",categoryDtos);

        } catch (NoSuchElementException e){
            System.out.println(e.getMessage());
            model.addAttribute("notFound" ,e.getMessage());
        }
        return "administrator/setting-product";
    }

    @GetMapping("search")
    public String searchProduct(@RequestParam(name="text", required = false) String text, @RequestParam(name="index",defaultValue = "0") String index, ModelMap modelMap){
        int pIndex = Integer.parseInt(index);

        Page<Product> products = productService.searchProduct(text,PageRequest.of(pIndex,10));

        modelMap.addAttribute("pageNo", 1);
        modelMap.addAttribute("products", products.getContent());
        modelMap.addAttribute("total", products.getTotalPages());
        modelMap.addAttribute("text", text);


        return "administrator/product-management";
    }

    @PostMapping("/disable")
    @ResponseBody
    public String disable(@RequestParam(name="id") String id ){
        try {
            productService.disableProduct(id);
            return "Vô hiệu hóa thành công";
        }catch (RuntimeException e){
            return e.getMessage();
        }
    }
    @PostMapping("/enable")
    @ResponseBody
    public String enable(@RequestParam(name="id") String id ){
        try {
            productService.enableProduct(id);
            return "Kích hoạt thành công";
        }catch (RuntimeException e){
            return e.getMessage();
        }
    }
//    @GetMapping ("search-import")
//    @ResponseBody
//    public List<ProductDTO> getProductImport(@RequestParam(name="text") String text,@RequestParam(name="sId",defaultValue = "0")String sId){
//            return productService.findBySupplierIdAndNameContain(sId,text);
//    }


    @GetMapping("/add")
    public String viewProduct(ModelMap modelMap){
        List<Category> listCategories = categoryService.findAll();
        List<Brand> listBrand = brandRepository.findAll();

//        List<SpecificationDto> specificationDtos = specificationService.findAll();
//        List<SupplierDTO> supplierDTOS = supplierService.getAllSupplier();
        modelMap.addAttribute("listCategories",listCategories);
        modelMap.addAttribute("listBrand",listBrand);
//        modelMap.addAttribute("specificationDtos", specificationDtos);
//        modelMap.addAttribute("listSuppliers",supplierDTOS);
        return "administrator/add-product";
    }

    @PostMapping(value = "/add")
    @ResponseBody
    public ResponseEntity<ResponseObject> addNewProduct(@Valid @RequestPart("products") ProductDTO productDTO, @Valid @RequestPart("file") MultipartFile multipartFile,BindingResult bindingResult) {
        try{
            if(bindingResult.hasErrors()){
                return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).body(new ResponseObject("01","Something went wrong!",bindingResult.getAllErrors()));
            }
           return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00",productService.addProduct(productDTO,multipartFile),""));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).body(new ResponseObject("01","Something went wrong!",e.getMessage()));
        }
    }


    @PostMapping("/addBrand")
    @ResponseBody
    public ResponseEntity<ResponseObject> addBrand(@RequestParam(name = "name") String brandName){
        try{
            if("".equals(brandName)){
                return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","Chưa nhập tên thương hiệu!",""));
            }
//            if(bindingResult.hasErrors()){
//                return ResponseEntity.status(HttpStatus.NOT_IMPLEMENTED).body(new ResponseObject("01","Something went wrong!",bindingResult.getAllErrors()));
//            }
            Brand brand = brandRepository.findBrandByName(brandName);
            if(brand != null){
                return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","Thương hiệu này đã tồn tại",""));
            }else{
                return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","Thêm thương hiệu thành công",brandRepository.save(new Brand(brandName))));
            }
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","Something went wrong!",e.getMessage()));
        }
    }
    @PostMapping("/getProductByBrand")
    public ResponseEntity<List<Product>> getProductByBrand(@RequestBody BrandDTO brand){
        try{
            System.out.println("brand dto:"+brand);
            List<Product> list = productRepository.findByBrand(brandRepository.findBrandByName(brand.getName()));
            System.out.println("list brand: "+list);

//            System.out.println("test brand: "+brandRepository.findById(brand.getId()));
//            List<Product> list = brandRepository.findById(brand.getId()).get().getProduct();
//            for(Product p: list){
//                System.out.println(p);
//            }
            return ResponseEntity.status(HttpStatus.OK).body(list);
        }catch (Exception e){
//            return ResponseEntity.status(HttpStatus.NOT_FOUND).body();
        }
        return null;
    }


    @PostMapping("/addCategory")
    @ResponseBody
    public ResponseEntity<Category> addCategoryInProductForm(@RequestBody CategoryDTO categoryDTO){
        try{
            Category category = categoryService.addCategory(categoryDTO.getName());
            return ResponseEntity.status(HttpStatus.OK).body(category);
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

//    @GetMapping("/getSku")
//    @ResponseBody
//    public List<SkuDTO> getSku(@RequestParam(name = "id") String id){
//        try{
//            System.out.println(id+"skusiz");
//            System.out.println(skuService.getSkuDtoByProductId(id).size()+"skusize");
//            return skuService.getSkuDtoByProductId(id);
//        }catch (Exception e){
//            System.out.println(e.getMessage()+"đây");
//            return null;
//        }
//
//    }
    @PostMapping("/update/{id}")
    @ResponseBody
    public String update(@PathVariable Integer id,@Valid @RequestBody ProductDTO productDTO){
        return "administrator/product-management";
    }
    }


