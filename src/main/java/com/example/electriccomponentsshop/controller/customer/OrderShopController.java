package com.example.electriccomponentsshop.controller.customer;

import com.example.electriccomponentsshop.common.OrderEnum;
import com.example.electriccomponentsshop.dto.*;
import com.example.electriccomponentsshop.entities.*;
import com.example.electriccomponentsshop.repositories.AccountRepository;
import com.example.electriccomponentsshop.repositories.OrderTransactionRepository;
import com.example.electriccomponentsshop.repositories.ProductRepository;
import com.example.electriccomponentsshop.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class OrderShopController {

    @Autowired
    CategoryService categoryService;

    @Autowired
    AccountService accountService;

    @Autowired
    OrderTransactionService orderTransactionService;

    @Autowired
    OrderTransactionRepository orderTransactionRepository;

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    ProductRepository productRepository;

    @Autowired
    ProvinceService provinceService;

    @Autowired
    DistrictService districtService;

    @Autowired
    WardService wardService;

//    @GetMapping(value = "/create-order")
//    public String createOrder (ModelMap map, Authentication authentication) {
//        AccountDetailImpl accountDetail = (AccountDetailImpl) authentication.getPrincipal();
//        List<CartItemDTO> cartItems = cartItemService.getCartItems(accountDetail.getId());
//        List<ProvinceDTO> provinces = provinceService.findAll();
//
//        AccountDTO account = accountService.findById(accountDetail.getId());
//        if (account.getDistrictName() != null && account.getWardName() != null) {
//            List<DistrictDTO> districts = districtService.findByProvinceName(account.getProvinceName());
//            List<WardDTO> wards = wardService.findByDistrictName(account.getDistrictName());
//
//            map.addAttribute("wards", wards);
//            map.addAttribute("districts", districts);
//        }
//
//        map.addAttribute("account", account);
//        map.addAttribute("provinces", provinces);
//        map.addAttribute("cartItems", cartItems);
//
//        return "customer/create-order";
//    }
//
//    @PostMapping(value = "/create-order")
//    public String createOrder (@RequestParam Map<String, String> order, RedirectAttributes redirectAttributes) {
//        int orderId = orderService.createOrderOnline(order);
//        redirectAttributes.addFlashAttribute("orderId",orderId);
//        return "redirect:/order";
//    }

    @GetMapping("/customer/cancelOrder")
    public String cancelOrderFromCustomer(@RequestParam(name = "id") String id, RedirectAttributes r){
        try{
            OrderTransaction orderTransaction = orderTransactionRepository.findById(Integer.parseInt(id)).get();
            orderTransaction.setStatus(OrderEnum.CANCEL.getName());
            orderTransactionRepository.save(orderTransaction);
            r.addFlashAttribute("cancelOrderMessage","Đã hủy thành công đơn hàng #" + orderTransaction.getOrderid());
        }catch (Exception e){
            r.addFlashAttribute("cancelOrderMessage","error");
        }
        return "redirect:/order/cancelled";
    }


    @GetMapping(value = "/order")
    public String getAllOrder (Authentication authentication, ModelMap map) {
        AccountDetailImpl accountDetail = (AccountDetailImpl) authentication.getPrincipal();
        Account account = accountRepository.findById(accountDetail.getId()).get();
        List<OrderTransaction> orders = orderTransactionRepository.findAllByAccountuser(account);
        List<OrderTransactionDTO> orderTransactionDTOS = convertOrderToDTO(orders);
        map.addAttribute("orders", orderTransactionDTOS);
        return "customer/all-orders";
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

    @GetMapping(value = "/order/{status}")
    public String getOrderByStatus (Authentication authentication, ModelMap map, @PathVariable String status) {
        AccountDetailImpl accountDetail = (AccountDetailImpl) authentication.getPrincipal();
        Account account = accountRepository.findById(accountDetail.getId()).get();
        List<OrderTransaction> orderTransactions = null;
        List<OrderTransactionDTO> orderTransactionDTOS = new ArrayList<>();
        String page = "";

        if (status.equals("waiting")) {
            orderTransactions = orderTransactionRepository.findAllByAccountuserAndStatus(account, OrderEnum.PENDING.getName());
            orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            page = "waiting-order";
        } else if (status.equals("shipping")) {
            orderTransactions = orderTransactionRepository.findAllByAccountuserAndStatus(account, OrderEnum.DELIVERY.getName());
            orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            page = "shipping-order";
        }else if(status.equals("accepted")){
            orderTransactions = orderTransactionRepository.findAllByAccountuserAndStatus(account, OrderEnum.CONFIRM.getName());
            orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            page = "accepted-order";
        }
        else if (status.equals("received")) {
            orderTransactions = orderTransactionRepository.findAllByAccountuserAndStatus(account, OrderEnum.DONE.getName());
            orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            page = "received-order";
        } else if (status.equals("cancelled")) {
            orderTransactions = orderTransactionRepository.findAllByAccountuserAndStatus(account, OrderEnum.CANCEL.getName());
            orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            page = "cancelled-order";
        }
        map.addAttribute("orders", orderTransactionDTOS);

        return "customer/"+page;
    }
}
