package com.example.electriccomponentsshop.controller.admin;



import com.example.electriccomponentsshop.common.OrderEnum;
import com.example.electriccomponentsshop.dto.*;
import com.example.electriccomponentsshop.entities.*;
import com.example.electriccomponentsshop.repositories.*;
import com.example.electriccomponentsshop.services.*;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.*;

@CrossOrigin
@Controller
@AllArgsConstructor
@RequestMapping("admin/warehouses")
public class WarehouseController {
    @Autowired
    final ProductWarehouseRepository productWarehouseRepository;
    @Autowired
    final ProductLocationRepository productLocationRepository;
    @Autowired
    final WarehouseRepository warehouseRepository;
    @Autowired
    final InventoryRepository inventoryRepository;
    @Autowired
    SupplierRepository supplierRepository;
    final
    WarehouseService warehouseService;
    final
    ProductService productService;
    final ProductWarehouseService productWarehouseService;
//    final
//    ImportTransactionService importTransactionService;
//    final ExportTransactionService exportTransactionService;
    final SupplierService supplierService;
    final ContainerService containerService;
//    final OrderService orderService;
    final ProvinceService provinceService;
    final DistrictService districtService;
    final WardService wardService;
    final InventoryService inventoryService;
    @GetMapping("")
    public String viewAll(Model model){
        List<WarehouseDTO> warehouses =warehouseService.getAllWarehouse();
        model.addAttribute("warehouses",warehouses);
        return "administrator/warehouse-management";

    }
    private ModelMap getAddress(ModelMap model) {

        List<ProvinceDTO> provinceDTOS = provinceService.findAll();
        model.addAttribute("listProvince", provinceDTOS);
        List<DistrictDTO> districtDTOS = districtService.findByProvinceName(provinceDTOS.get(0).getName());
        model.addAttribute("listDistrict", districtDTOS);
        List<WardDTO> wardDTOS = wardService.findByDistrictName(districtDTOS.get(0).getName());
        model.addAttribute("listWard", wardDTOS);
        return model;
    }
    @PostMapping("/edit/{id}")
    public String update(@PathVariable(name="id") String id, @Valid @ModelAttribute("warehouseDto") WarehouseDTO warehouseDTO, ModelMap modelMap,BindingResult bindingResult){
        try{
            if(bindingResult.hasErrors()){
                bindingResult.getFieldErrors().forEach(fieldError -> modelMap.addAttribute(fieldError.getField(),fieldError.getDefaultMessage()));

            }else {
                warehouseService.update(warehouseDTO,id);
                modelMap.addAttribute("success",1);
            }

        }catch (RuntimeException e){
            modelMap.addAttribute("error",e.getMessage());
        }
       return "redirect:/admin/warehouses";
    }
    @GetMapping("/edit/{id}")
    public String viewUpdateForm(ModelMap modelMap,@PathVariable(name="id") String id){
        try{
            getAddress(modelMap);
            WarehouseDTO warehouseDTO = warehouseService.getWarehouseDtoById(id);
            modelMap.addAttribute("warehouseDto",warehouseDTO);
        }catch (RuntimeException e){
            modelMap.addAttribute("error", e.getMessage());
        }
        return "administrator/setting-warehouse";
    }
    @GetMapping("/add")
    public String viewAddForm(ModelMap model){
        getAddress(model);
        model.addAttribute("newWarehouse",new WarehouseDTO());
        return "administrator/add-warehouse";
    }
    @PostMapping("/add")
    public String addWarehouse(Model model, @Valid @ModelAttribute("newWarehouse") WarehouseDTO warehouseDTO, BindingResult bindingResult){
        if(bindingResult.hasErrors()){

        }
        else {
            warehouseService.add(warehouseDTO);
        }
        return "redirect:/admin/warehouses";
    }
    @GetMapping("/import/add")
    public String viewFormAddImp(ModelMap modelMap, @RequestParam(name="index",defaultValue = "0") String index){
        List<Supplier> listSupplier = supplierRepository.findSupplierByActive(1);
        List<WarehouseDTO> listWarehouse = warehouseService.getAllWarehouse();
        Page<Product> products =  productService.findAll(PageRequest.of(Integer.parseInt(index),10));
        modelMap.addAttribute("products", products.getContent());
        modelMap.addAttribute("total",products.getTotalPages());
//        List<ContainerDTO> listContainer = containerService.getAllContainer();
//        System.out.println(listContainer.stream().findFirst().get().getShelf()+ "gw") ;
//        modelMap.addAttribute("listSupplier",listSupplier);
        modelMap.addAttribute("listWarehouses",listWarehouse);
        modelMap.addAttribute("listSupplier", listSupplier);
//        modelMap.addAttribute("listContainer",listContainer);
        return "administrator/add-warehouse-import";
    }

    @GetMapping("/getProducts")
    @ResponseBody
    public ResponseEntity<ResponseObject> getProductsToImport(@RequestParam(name="index",defaultValue = "0") String index){
        Page<Product> products =  productService.findAll(PageRequest.of(Integer.parseInt(index),10));
        List<ProductDTO> productDTOS = new ArrayList<>();
        for(Product product : products.getContent()){
            ProductDTO productDTO = new ProductDTO();
            productDTO.setCode(product.getCode());
            productDTO.setName(product.getName());
            productDTO.setImage(product.getImage());
            productDTO.setOriginal_price(product.getOriginal_price() == null ? new BigDecimal(0) : product.getOriginal_price());
            productDTO.setPrice(product.getPrice() == null ? new BigDecimal(0) : product.getPrice());

            productDTOS.add(productDTO);
        }
        return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","Get product success",productDTOS));
    }

    @GetMapping("searchProduct")
    @ResponseBody
    public ResponseEntity<ResponseObject> searchProduct(@RequestParam(name="text", required = false) String text, @RequestParam(name="index",defaultValue = "0") String index){
        int pIndex = Integer.parseInt(index);
        Page<Product> products = productService.searchProduct(text,PageRequest.of(pIndex,10));
        List<ProductDTO> productDTOS = new ArrayList<>();
        for(Product product : products.getContent()){
            ProductDTO productDTO = new ProductDTO();
            productDTO.setCode(product.getCode());
            productDTO.setName(product.getName());
            productDTO.setImage(product.getImage());
            productDTO.setOriginal_price(product.getOriginal_price() == null ? new BigDecimal(0) : product.getOriginal_price());
            productDTO.setPrice(product.getPrice() == null ? new BigDecimal(0) : product.getPrice());

            productDTOS.add(productDTO);
        }
        return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","success", productDTOS));
    }

    @GetMapping("/view/import")
    public String viewListImport(ModelMap modelMap){
        try{
            List<Inventory> inventories = inventoryRepository.findAll();
            modelMap.addAttribute("inventories",inventories);
//            List<ImportTransactionDto> importTransactionDtoList =importTransactionService.findAll();
//            modelMap.addAttribute("listImport", importTransactionDtoList );
        }catch (NoSuchElementException e){
            modelMap.addAttribute("notFound","Không có dữ liệu");
        }
        return "administrator/Inventory";
    }
    @PostMapping("/import/add")
    @ResponseBody
    public ResponseEntity<ResponseObject> addImportTransaction( @Valid @RequestBody ProductWarehouseDTO productWarehouseDTO, BindingResult bindingResult){
        try{
            if(bindingResult.hasErrors()){
                Map<String, String> errors= new HashMap<>();
                bindingResult.getFieldErrors().forEach(
                        error -> errors.put(error.getField(), error.getDefaultMessage())
                );
                String errorMsg= "";

                for(String key: errors.keySet()){
                    errorMsg += "Lỗi ở: " + key + ", lí do: " + errors.get(key) + "\n";
                }
                return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","Thêm sản phẩm vào kho không thành công", errorMsg));
            }
            for(ImportProductDTO p : productWarehouseDTO.getImportProducts()){
                if(p.getProduct_code().equalsIgnoreCase("null") || p.getProduct_code().equals("")){
                    return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","Thêm sản phẩm vào kho không thành công", "Mã sản phẩm không tồn tại"));
                }
            }


            List<ProductWarehouseDTO> productWareHouseList = productWarehouseService.addProductToWarehouse(productWarehouseDTO);
            if(productWareHouseList != null && inventoryService.addInventoryImport(productWarehouseDTO)){
                return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","Thêm sản phẩm vào kho thành công", productWareHouseList));
            }else{
                return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","Thêm sản phẩm vào kho không thành công", "Không thể thêm sản phẩm"));
            }
//            if(productWareHouseList != null){
//                if(inventoryService.addInventoryImport(productWarehouseDTO)){
//                    return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","Thêm sản phẩm vào kho thành công", productWareHouseList));
//                }else{
//                    return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","Thêm sản phẩm vào kho không thành công", "Không thể thêm sản phẩm"));
//                }
//            }else{
//                return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","Thêm sản phẩm vào kho không thành công", "Mã sản phẩm không tồn tại"));
//            }
//            importTransactionService.addImportTransaction(importTransactionDto);
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","Thêm sản phẩm vào kho không thành công", e.getMessage()));
        }

    }
//    @GetMapping("/import/update/{id}")
//    public String updateImportTransaction(ModelMap modelMap, @PathVariable(name = "id") String id){
//        try{
//            ImportTransactionDto importTransactionDto = importTransactionService.getDtoById(id);
//            modelMap.addAttribute("importTransactionDto",importTransactionDto);
//
//        }catch (NoSuchElementException e){
//            modelMap.addAttribute("notFound","Không tìm thấy giao dịch này");
//            modelMap.addAttribute("success", 0);
//        }
//        return "administrator/setting-warehouse-import";
//    }
    @PostMapping("/disable")
    @ResponseBody
    public String disable(@RequestParam(name="id") String id ){
        try {
            warehouseService.disableWarehouse(id);
            return "Vô hiệu hóa thành công";
        }catch (RuntimeException e){
            return e.getMessage();
        }
    }
    @PostMapping("/enable")
    @ResponseBody
    public String enable(@RequestParam(name="id") String id ){
        try {
            warehouseService.enableWarehouse(id);
            return "Kích hoạt thành công";
        }catch (RuntimeException e){
            return e.getMessage();
        }
    }

    @GetMapping("/getProductLocation")
    @ResponseBody
    public ResponseEntity<ResponseObject> getProductLocation(@RequestParam(name = "w_id") String warehouse_id){
        Warehouse warehouse = warehouseService.getWarehouse(warehouse_id);
        String data = "<option value=\"0\"> Chọn vị trí lưu sản phẩm </option>";
        if(warehouse != null){
            List<ProductLocation> productLocations = productLocationRepository.findProductLocationByWarehouse(warehouse);
            for(ProductLocation pl : productLocations){
                data += "<option value=" + pl.getId() + ">" + pl.getName() + "</option>"+" ";
            }
            return  ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","Lấy vị trí thành công", data));
        }else{
            return  ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","Không tìm thấy kho này",""));
        }

    }

    @PostMapping("/addProductLocation")
    @ResponseBody
    public ResponseEntity<ResponseObject> addProductLocation(@RequestParam(name = "location_name") String location_name, @RequestParam(name = "w_id") String warehouse_id){

            ProductLocation productLocation = null;
            Warehouse warehouse = warehouseRepository.findWarehouseById(Integer.parseInt(warehouse_id));
            if(productLocationRepository.findProductLocationByWarehouse(warehouse) != null){
                 productLocation = productLocationRepository.findProductLocationByWarehouseAndName(warehouse, location_name);
            }
            if(productLocation != null){
                return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","Vị trí này đã tồn tại",""));
            }else{
                if(Integer.parseInt(warehouse_id) <= 0){
                    return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","Vui lòng chọn vị trí lưu kho",""));
                }
                ProductLocation productLocation1 = productLocationRepository.save(new ProductLocation(warehouse,location_name));
//                ProductWareHouse productWareHouse = productWarehouseRepository.save(new ProductWareHouse(productLocation1, warehouse,0));
                return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","Thêm vị trí thành công",productLocation1));
            }

    }

    @GetMapping("/view/export")
    public String viewExports(ModelMap modelMap){
//        try{
//            List<ExportTransactionDto> exportTransactionDtos =exportTransactionService.findAll();
//            modelMap.addAttribute("listOfExport", exportTransactionDtos );
//        }catch (NoSuchElementException e){
//            modelMap.addAttribute("notFound","Không có dữ liệu");
//        }
        return "administrator/warehouse-export-management";
    }
//    @PostMapping("/export/update")
//    @ResponseBody
//    public String updateExport(@Valid @RequestBody ExportTransactionDto exportTransactionDto){
//        String response = "";
//        try{
//            exportTransactionService.updateExportTransaction(exportTransactionDto);
//            response ="cập nhật thành công";
//
//        }catch (RuntimeException e){
//            response = e.getMessage();
//        }
//        return  response;
//    }
//    @GetMapping("/export/edit/{id}")
//    public String viewFormUpdateExport(ModelMap modelMap,@PathVariable(name = "id") String id){
//        ExportTransactionDto exportTransactionDto = exportTransactionService.getDtoById(id);
//        modelMap.addAttribute("exportTransaction" , exportTransactionDto);
//        return "administrator/setting-warehouse-export";
//    }
    @GetMapping("/export/add")
    public String viewAddExport(ModelMap modelMap){
        try{
//            List<OrderDTO> orderDTOList = orderService.findByStatus(OrderEnum.CONFIRM.getName());
//            modelMap.addAttribute("listOrders", orderDTOList);
        }
        catch (Exception e){
            modelMap.addAttribute("notFound", e.getMessage());
        }
        return "administrator/add-warehouse-export";
    }
//    @PostMapping("/export/add")
//    @ResponseBody
//    public String addExportTransaction(ModelMap modelMap,@Valid @RequestBody ExportTransactionDto exportTransactionDto){
//        try{
//            exportTransactionService.addExportTransaction(exportTransactionDto);
//            return "thành công";
//        }catch (NoSuchElementException e){
//           return e.getMessage();
//        }
//    }
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public @ResponseBody Map<String,String> error(MethodArgumentNotValidException m){
        System.out.println("gg");
        Map<String,String> map = new HashMap<>();
        m.getFieldErrors().forEach(e->map.put(e.getField(),e.getDefaultMessage()));

        return map;
    }

}
