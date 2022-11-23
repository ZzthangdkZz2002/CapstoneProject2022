package com.example.electriccomponentsshop.controller.onlinepage;

import com.example.electriccomponentsshop.dto.OrderTransactionDTO;
import com.example.electriccomponentsshop.dto.OrderTransactionDetailDTO;
import com.example.electriccomponentsshop.dto.ProductDTO;
import com.example.electriccomponentsshop.entities.OrderTransaction;
import com.example.electriccomponentsshop.entities.OrderTransactionDetail;
import com.example.electriccomponentsshop.entities.Product;
import com.example.electriccomponentsshop.repositories.OrderTransactionRepository;
import com.example.electriccomponentsshop.repositories.ProductRepository;
import com.example.electriccomponentsshop.sendOTP.StoreOTPandPhoneNumber;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/tracking")
public class TrackingOrder {

    @Autowired
    OrderTransactionRepository orderTransactionRepository;
    @Autowired
    ProductRepository productRepository;

    @GetMapping("/trackingOrder")
    public String trackingOrder(ModelMap map){
        return "onlinePage/trackingOrderHistory";
    }

    @GetMapping("/verifyOtp")
    public String verifyOtpForm(@RequestParam(name = "phone") String phone, ModelMap map){
        map.addAttribute("phone",phone);
        return "onlinePage/verifyOtp";
    }
    @GetMapping("/test")
    public String test(ModelMap map){
        List<OrderTransaction> orderTransactions = orderTransactionRepository.findAllByUserphone("0336252948");
        List<OrderTransactionDTO> orderTransactionDTOS = convertOrderToDTO(orderTransactions);
        map.addAttribute("orders", orderTransactionDTOS);
        return "onlinePage/OrderHistory";
    }

    @PostMapping("/verifyOtp")
    public String verifyOtp(@RequestParam(name = "txtOTP") String res_otp, @RequestParam(name = "phone") String phone_number, ModelMap map){
        if(res_otp.equals(StoreOTPandPhoneNumber.getOtp())){
            List<OrderTransaction> orderTransactions = orderTransactionRepository.findAllByUserphone(phone_number);
            List<OrderTransactionDTO> orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            map.addAttribute("orders", orderTransactionDTOS);
            map.addAttribute("phone", phone_number);
            StoreOTPandPhoneNumber.setOtp(UUID.randomUUID().toString());
            return "onlinePage/OrderHistory";
        }else{
            map.addAttribute("wrongOtp","Mã OTP không chính xác!!");
            map.addAttribute("phone",phone_number);
            return "onlinePage/verifyOtp";
        }
    }

    public List<OrderTransactionDTO> convertOrderToDTO(List<OrderTransaction> orderTransactions){
        List<OrderTransactionDTO> orderTransactionDTOS = new ArrayList<>();
        if(orderTransactions != null){
            for(OrderTransaction orderTransaction: orderTransactions){
                OrderTransactionDTO orderTransactionDTO = new OrderTransactionDTO();
                if(orderTransaction.getCustomer() != null){
                    orderTransactionDTO.setCustomer(orderTransaction.getCustomer());
                }
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
