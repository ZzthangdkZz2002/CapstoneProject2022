package com.example.electriccomponentsshop.controller.admin;



import com.example.electriccomponentsshop.common.OrderEnum;
import com.example.electriccomponentsshop.dto.*;
import com.example.electriccomponentsshop.entities.*;
import com.example.electriccomponentsshop.repositories.*;
import com.example.electriccomponentsshop.services.*;
import com.j256.ormlite.stmt.query.In;
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
    final ProductsImportRepository productsImportRepository;
    @Autowired
    final WarehouseRepository warehouseRepository;
    @Autowired
    final InventoryRepository inventoryRepository;
    @Autowired
    SupplierRepository supplierRepository;
    @Autowired
    OrderTransactionRepository orderTransactionRepository;
    @Autowired
    ProductRepository productRepository;
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
            productService.setProductQuantity(productWarehouseDTO);
            if(productWareHouseList != null && inventoryService.addInventoryImport(productWarehouseDTO)){
                if(!"0".equals(productWarehouseDTO.getSupplier_id()) || productWarehouseDTO.getSupplier_id() == null){
                    supplierService.addDebtAndPurchaseToSupplier(productWarehouseDTO);
                }
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

    @GetMapping("/getImportItems")
    @ResponseBody
    public ResponseEntity<ResponseObject> getImportProducts(@RequestParam(name = "code") Integer inventory_id){
        Optional<Inventory> inventory = inventoryRepository.findById(inventory_id);
        if(inventory.isPresent()){
            List<ProductsImport> productsImports = inventory.get().getProductsImports();
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","success",productsImports));
        }else{
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","Không tìm thấy Inventory",""));
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
            List<OrderTransaction> orderTransactions = orderTransactionRepository.findAllByStatus(OrderEnum.CONFIRM.getName());
            List<OrderTransactionDTO> orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            modelMap.addAttribute("listOrders", orderTransactionDTOS);
        }
        catch (Exception e){
            modelMap.addAttribute("notFound", e.getMessage());
        }
        return "administrator/add-warehouse-export";
    }
    @GetMapping("/export/detail/add")
    public String exportItem(@RequestParam(name = "orderid") String orderid, ModelMap modelMap){
        OrderTransaction orderTransaction = orderTransactionRepository.findByOrderid(orderid).get();
        OrderTransactionDTO orderTransactionDTO = convertOrderToDTO2(orderTransaction);
        modelMap.addAttribute("order",orderTransactionDTO);
        return "administrator/warehouse-export-detail";
    }

    @GetMapping("/getWarehouse")
    @ResponseBody
    public ResponseEntity<ResponseObject> getAvailableItemWarehouse(@RequestParam(name = "pid") String product_id){
        List<String> warehouses = productWarehouseRepository.findWarehouseByProductId(Integer.parseInt(product_id));
        if(warehouses != null && warehouses.size() > 0){
            List<WarehouseDTO> warehouseList = new ArrayList<>();
            for(String w_id : warehouses){
                Warehouse warehouse = warehouseRepository.findWarehouseById(Integer.parseInt(w_id));
                warehouseList.add(convertToWarehouseDTO(warehouse));
            }
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","get warehouse success",warehouseList));
        }else{
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","get warehouse fail","Sản phẩm này không còn trong kho"));
        }
    }

    @GetMapping("/getLocation")
    @ResponseBody
    public ResponseEntity<ResponseObject> getLocationAvailableQuantityLocation(@RequestParam("pid") String p_id, @RequestParam("wid") String w_id){
        try{
            List<ProductWarehouse2DTO> productWareHouses = productWarehouseRepository.findLocationByProductId(Integer.parseInt(p_id));
            List<ProductWarehouse2DTO> productWarehouse2DTOS = new ArrayList<>();
            for(ProductWarehouse2DTO pw : productWareHouses){
                System.out.println("total: "+pw.getTotal());
                ProductLocation productLocation = pw.getProductLocation();
                if(productLocation.getWarehouse().getId() == Integer.parseInt(w_id)){
                    productWarehouse2DTOS.add(pw);
                }
            }
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","get location success",productWarehouse2DTOS));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","get location fail",e.getMessage()));
        }
    }

    @GetMapping("/getProductQuantity")
    @ResponseBody
    public ResponseEntity<ResponseObject> getProductQuantity(@RequestParam("lid") String l_id, @RequestParam("pid") String p_id){
        try{
            int quantity = productWarehouseRepository.findProductQuantity(Integer.parseInt(p_id), Integer.parseInt(l_id));
//            List<Integer> quantities = new ArrayList<>();
//           Product product = productRepository.findById(Integer.parseInt(p_id)).get();
//           ProductLocation productLocation = productLocationRepository.findById(Integer.parseInt(l_id)).get();
//           List<ProductWareHouse> productWareHouses = productWarehouseRepository.findProductWareHouseByProductLocationAndProduct(productLocation,product);
//           for(ProductWareHouse pw : productWareHouses){
//               quantities.add(pw.getQuantity());
//           }
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","get quantity success", quantity));
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","get quantity fail",e.getMessage()));
        }
    }

    public ProductLocationDTO converToProductLocationDTO(ProductLocation productLocation){
        ProductLocationDTO productLocationDTO = new ProductLocationDTO();
        productLocationDTO.setId(String.valueOf(productLocation.getId()));
        productLocationDTO.setName(productLocation.getName());

        return productLocationDTO;
    }

    public WarehouseDTO convertToWarehouseDTO(Warehouse warehouse){
        WarehouseDTO warehouseDTO = new WarehouseDTO();
        warehouseDTO.setId(String.valueOf(warehouse.getId()));
        warehouseDTO.setName(warehouse.getName());

        return warehouseDTO;
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

    public OrderTransactionDTO convertOrderToDTO2(OrderTransaction orderTransaction){
        try{
            if(orderTransaction != null){
                OrderTransactionDTO orderTransactionDTO = new OrderTransactionDTO();
                orderTransactionDTO.setId(orderTransaction.getId());
                orderTransactionDTO.setOrderid(orderTransaction.getOrderid());
                orderTransactionDTO.setStatus(orderTransaction.getStatus());
//                orderTransactionDTO.setUser_name(orderTransaction.getUser_name());
//                orderTransactionDTO.setUser_email(orderTransaction.getUser_email());
//                orderTransactionDTO.setUser_phone(orderTransaction.getUser_phone());
//                orderTransactionDTO.setAddress(orderTransaction.getAddress());
                orderTransactionDTO.setAmount(String.valueOf(orderTransaction.getAmount()));
                orderTransactionDTO.setPayment_method(orderTransaction.getPayment_method());
                orderTransactionDTO.setOrderKind(orderTransaction.getOrderKind());
//                orderTransactionDTO.setAccount_user(orderTransaction.getAccountuser());
//                orderTransactionDTO.setAccount_employee(orderTransaction.getAccountemployee());
                orderTransactionDTO.setCreated(orderTransaction.getCreated());

                List<OrderTransactionDetailDTO> orderTransactionDetailDTOS = new ArrayList<>();
                for(OrderTransactionDetail orderTransactionDetail : orderTransaction.getOrderTransactionDetails()){
                    OrderTransactionDetailDTO orderTransactionDetailDTO = new OrderTransactionDetailDTO();
                    ProductDTO p = new ProductDTO();
                    Product product = productRepository.findById(orderTransactionDetail.getProduct_id()).get();
                    p.setId(product.getId());
                    p.setCode(product.getCode());
                    p.setName(product.getName());
                    p.setImage(product.getImage());
                    p.setOriginal_price(product.getOriginal_price());
                    p.setPrice(product.getPrice());
                    p.setQuantity(product.getQuantity());
                    if(product.getDescription() != null){
                        p.setDescription(product.getDescription());
                    }
                    p.setAddedDate(product.getAddedDate());
                    if(product.getBrand() != null){
                        p.setBrand(product.getBrand());
                    }
                    if(product.getCategories() != null){
                        p.setCategories(product.getCategories());
                    }

                    orderTransactionDetailDTO.setAmount(orderTransactionDetail.getAmount());
                    orderTransactionDetailDTO.setQuantity(orderTransactionDetail.getQuantity());
                    orderTransactionDetailDTO.setProductDTO(p);

                    orderTransactionDetailDTOS.add(orderTransactionDetailDTO);
                }
                orderTransactionDTO.setOrderTransactionDetails(orderTransactionDetailDTOS);


                return orderTransactionDTO;
            }else{
                return null;
            }
        }catch (Exception e){
            return null;
        }

    }


    public List<OrderTransactionDTO> convertOrderToDTO(List<OrderTransaction> orderTransactions){
        List<OrderTransactionDTO> orderTransactionDTOS = new ArrayList<>();
        if(orderTransactions != null){
            for(OrderTransaction orderTransaction: orderTransactions){
                OrderTransactionDTO orderTransactionDTO = new OrderTransactionDTO();
                orderTransactionDTO.setId(orderTransaction.getId());
                orderTransactionDTO.setOrderid(orderTransaction.getOrderid());
                orderTransactionDTO.setStatus(orderTransaction.getStatus());
                orderTransactionDTO.setUser_name(orderTransaction.getUser_name());
                orderTransactionDTO.setUser_email(orderTransaction.getUser_email());
                orderTransactionDTO.setUser_phone(orderTransaction.getUser_phone());
                orderTransactionDTO.setAddress(orderTransaction.getAddress());
                orderTransactionDTO.setAmount(String.valueOf(orderTransaction.getAmount()));
                orderTransactionDTO.setPayment_method(orderTransaction.getPayment_method());
                orderTransactionDTO.setOrderKind(orderTransaction.getOrderKind());
                orderTransactionDTO.setAccount_user(orderTransaction.getAccountuser());
                orderTransactionDTO.setAccount_employee(orderTransaction.getAccountemployee());
                orderTransactionDTO.setCreated(orderTransaction.getCreated());

                List<OrderTransactionDetailDTO> orderTransactionDetailDTOS = new ArrayList<>();
                for(OrderTransactionDetail orderTransactionDetail : orderTransaction.getOrderTransactionDetails()){
                    OrderTransactionDetailDTO orderTransactionDetailDTO = new OrderTransactionDetailDTO();
                    ProductDTO p = new ProductDTO();
                    Product product = productRepository.findById(orderTransactionDetail.getProduct_id()).get();
                    p.setId(product.getId());
                    p.setCode(product.getCode());
                    p.setName(product.getName());
                    p.setImage(product.getImage());
                    p.setOriginal_price(product.getOriginal_price());
                    p.setPrice(product.getPrice());
                    p.setQuantity(product.getQuantity());
                    p.setDescription(product.getDescription());
                    p.setAddedDate(product.getAddedDate());
                    p.setBrand(product.getBrand());
                    p.setCategories(product.getCategories());

                    orderTransactionDetailDTO.setAmount(orderTransactionDetail.getAmount());
                    orderTransactionDetailDTO.setQuantity(orderTransactionDetail.getQuantity());
                    orderTransactionDetailDTO.setProductDTO(p);

                    orderTransactionDetailDTOS.add(orderTransactionDetailDTO);
                }
                orderTransactionDTO.setOrderTransactionDetails(orderTransactionDetailDTOS);
                orderTransactionDTOS.add(orderTransactionDTO);
            }
            return orderTransactionDTOS;
        }else{
            return null;
        }
    }

}



