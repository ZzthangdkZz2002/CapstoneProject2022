package com.example.electriccomponentsshop.controller.admin;

import com.example.electriccomponentsshop.common.OrderEnum;
import com.example.electriccomponentsshop.dto.*;
import com.example.electriccomponentsshop.entities.OrderTransaction;
import com.example.electriccomponentsshop.entities.OrderTransactionDetail;
import com.example.electriccomponentsshop.entities.Product;
import com.example.electriccomponentsshop.repositories.OrderTransactionRepository;
import com.example.electriccomponentsshop.repositories.ProductRepository;
import com.example.electriccomponentsshop.services.*;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.util.*;

@AllArgsConstructor
@CrossOrigin
@Controller
@RequestMapping("admin/orders")
public class OrderController {
//    @Autowired
//    OrderRepository r;
//    @Autowired
//    ProductRepository p;
//
//    @Autowired
//    OrderItemRepository orderItemRepository;
    @Autowired
    ProvinceService provinceService;
    @Autowired
    DistrictService districtService;
    @Autowired
    WardService wardService;
    @Autowired
    ProductService productService;
    @Autowired
    OrderTransactionRepository orderTransactionRepository;
    final
    OrderTransactionService orderTransactionService;


    @Autowired
    ProductRepository productRepository;
//    @Autowired
//    OrderItemService orderItemService;
//    @Autowired
//    OrderKindService orderKindService;
//    @Autowired
//    SkuService skuService;
    @GetMapping("/{status}")
    public String viewAllOrderByEmployeeId(@PathVariable String status, ModelMap modelMap, Authentication authentication) {
        AccountDetailImpl accountDetail = (AccountDetailImpl) authentication.getPrincipal();
        List<OrderTransaction> orderTransactions;
        List<OrderTransactionDTO> orderTransactionDTOS= new ArrayList<>();
        String active = "";

        if (status.equals("waiting")) {
            orderTransactions = orderTransactionRepository.findAllByStatus(OrderEnum.PENDING.getName());
            orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            active = "waiting";
        } else if (status.equals("confirmed")) {
            orderTransactions = orderTransactionRepository.findAllByStatus(OrderEnum.CONFIRM.getName());
            orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            active = "confirmed";
        } else if (status.equals("shipping")) {
            orderTransactions = orderTransactionRepository.findAllByStatus(OrderEnum.DELIVERY.getName());
            orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            active = "shipping";
        } else if (status.equals("received")) {
            orderTransactions = orderTransactionRepository.findAllByStatus(OrderEnum.DONE.getName());
            orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            active = "received";
        } else if (status.equals("cancelled")) {
            orderTransactions = orderTransactionRepository.findAllByStatus(OrderEnum.CANCEL.getName());
            orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            active = "cancelled";
        } else if (status.equals("returned")) {
            orderTransactions = orderTransactionRepository.findAllByStatus(OrderEnum.RETURNED.getName());
            orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            active = "returned";
        }

        modelMap.addAttribute("active", active);
        modelMap.addAttribute("listOrder", orderTransactionDTOS);

        return "administrator/order-management";
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

    @GetMapping("/accept")
    public String acceptOrder(@RequestParam(name = "id") String id, RedirectAttributes r){
        try{
            OrderTransaction orderTransaction = orderTransactionRepository.findById(Integer.parseInt(id)).get();
            orderTransaction.setStatus(OrderEnum.CONFIRM.getName());
            orderTransactionRepository.save(orderTransaction);
            r.addFlashAttribute("acceptOrderMessage","Xác nhận thành công đơn hàng #" + orderTransaction.getOrderid());
        }catch (Exception e){
            r.addFlashAttribute("acceptOrderMessage","error");
        }
        return "redirect:/admin/orders/confirmed";
    }

//    private ModelMap getAddress(ModelMap model) {
//        List<ProvinceDTO> provinceDTOS = provinceService.findAll();
//        System.out.println(provinceDTOS.get(0).getName() + "đâ ");
//        model.addAttribute("listProvince", provinceDTOS);
//        List<DistrictDTO> districtDTOS = districtService.findByProvinceName(provinceDTOS.get(0).getName());
//        System.out.println(districtDTOS.get(0).getName() + "đâ ");
//        model.addAttribute("listDistrict", districtDTOS);
//        List<WardDTO> wardDTOS = wardService.findByDistrictName(districtDTOS.get(0).getName());
//        model.addAttribute("listWard", wardDTOS);
//        return model;
//    }
//
//    @GetMapping("/view/{id}")
//
//    public String viewOrder(@PathVariable String id, Model modelMap) {
//        try {
//            Integer orderId = Integer.parseInt(id);
//
//            OrderDTO orderDTO = orderService.findById(orderId);
//            modelMap.addAttribute("orderDto", orderDTO);
//            return "administrator/order-detail";
//        } catch (NumberFormatException | NoSuchElementException e) {
//            modelMap.addAttribute("notFound", e.getMessage());
//            return "administrator/order-detail";
//        }
//
//    }
//
//    @GetMapping("/see/{status}")
//    public String viewOrderByStatus(@PathVariable String status, ModelMap model) {
//        ArrayList<Order> orders = (ArrayList<Order>) orderService.findOrdersByStatus(status);
//        model.addAttribute("orders", orders);
//        return "administrator/order-management";
//    }
//
//    @GetMapping("/update/{id}")
//    public String viewOrderUpdate(@PathVariable String id, ModelMap modelMap) {
//        System.out.println("capp");
//        OrderDTO orderDTO = orderService.findById(Integer.parseInt(id));
//        modelMap.addAttribute("orderDto", orderDTO);
//        getAddress(modelMap);
//        return "administrator/setting-order";
//    }
//
//    @PostMapping("/update/{id}")
//    public String updateStatus(@PathVariable String id) {
//        System.out.println("cập nhật");
//        orderService.updateStatus(Integer.parseInt(id));
//        return "redirect:/admin/orders/view/" + id;
//    }
//    @PostMapping("cancel/{id}")
//    public String cancelOrder(@PathVariable String id){
//        orderService.cancelOrder(id);
//        return "redirect:/admin/orders/view/" + id;
//    }
//    @PostMapping("returned/{id}")
//    public String returnedOrder(@PathVariable String id){
//        orderService.returnedOrder(id);
//        return "redirect:/admin/orders/view/" + id;
//    }
//    @PostMapping("/save/{id}")
//    @ResponseBody
//    public String saveOrder(@Valid @RequestBody OrderDTO orderDTO, @PathVariable String id, ModelMap model) {
//        String response = "";
//        System.out.println("đây cơ");
//        if (orderService.updateOrder(id, orderDTO)) {
//            response = "thành công";
//            System.out.println(response);
//        } else response = "thất bại";
//        return response;
//    }
//    @GetMapping("/view")
//    @ResponseBody
//    public Map<String,List<SkuDTO>> getItems(@RequestParam(name="id") String id){
//        try{
//            Map<String,List<SkuDTO>> map = new HashMap<>();
//            for (OrderItemDTO orderItemDTO: orderService.getOrderDtoById(id).getOrderItems()
//            ) {
//                ObjectMapper objectMapper = new ObjectMapper();
//                String itemDto = objectMapper.writeValueAsString(orderItemDTO);
//                List<SkuDTO> skuDTOS = skuService.getSkuDtoByProductId(orderItemDTO.getProductId());
//                map.put(itemDto,skuDTOS);
//            }
//
//            //System.out.println(orderService.getOrderDtoById(id).getOrderItems().size()+"dex");
//            return map ;
//        }catch (Exception e){
//            System.out.println(e.getMessage()+"hoangdex");
//            return null;
//        }
//
//    }
//    @GetMapping("/add")
//    public String viewAddForm(ModelMap model) {
//        try{
//            List<ProductDTO> productDTOList = productService.findAll();
//            List<OrderKindDTO> orderTypeList = orderKindService.findAll();
//            model.addAttribute("listProduct", productDTOList);
//            model.addAttribute("listType", orderTypeList);
//            getAddress(model);
//        }
//        catch (NoSuchElementException e){
//            System.out.println(e.getMessage()+"ff");
//            model.addAttribute("notFound", e.getMessage());
//
//        }
//
//        return "administrator/create-new-order";
//
//
//    }
//
//    @PostMapping("/add")
//    @ResponseBody
//    public String create(@Valid @RequestBody OrderDTO orderDTO) {
//
//        try {
//            if(orderService.createOrder(orderDTO)){
//                return "thành công";
//            }
//            else    return "thất bại";
//        } catch (Exception e) {
//            return "thất bại";
//        }
//
//    }
//
//    @ExceptionHandler(MethodArgumentNotValidException.class)
//    public @ResponseBody Map<String, String> error(MethodArgumentNotValidException m) {
//        System.out.println("gg");
//        Map<String, String> map = new HashMap<>();
//        m.getFieldErrors().forEach(e -> map.put(e.getField(), e.getDefaultMessage()));
//
//        return map;
//    }

}
