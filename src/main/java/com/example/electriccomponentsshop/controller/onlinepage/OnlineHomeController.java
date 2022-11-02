package com.example.electriccomponentsshop.controller.onlinepage;

import com.example.electriccomponentsshop.dto.OrderTransactionDTO;
import com.example.electriccomponentsshop.dto.ProductDTO;
import com.example.electriccomponentsshop.dto.ResponseObject;
import com.example.electriccomponentsshop.entities.OrderTransaction;
import com.example.electriccomponentsshop.entities.OrderTransactionDetail;
import com.example.electriccomponentsshop.entities.Product;
import com.example.electriccomponentsshop.repositories.OrderTransactionDetailRepository;
import com.example.electriccomponentsshop.repositories.OrderTransactionRepository;
import com.example.electriccomponentsshop.repositories.ProductRepository;
import com.example.electriccomponentsshop.services.AccountDetailImpl;
import com.example.electriccomponentsshop.services.OrderTransactionService;
import com.example.electriccomponentsshop.services.ProductService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@AllArgsConstructor
@CrossOrigin
@Controller
@RequestMapping("/homepage")
public class OnlineHomeController {

    final ProductService productService;

    final OrderTransactionService orderTransactionService;

    @Autowired
    OrderTransactionDetailRepository orderTransactionDetailRepository;

    @Autowired
    OrderTransactionRepository orderTransactionRepository;

    @Autowired
    final ProductRepository productRepository;

    @GetMapping("")
    public String homePage(){
        return "onlinePage/home";
    }

    @GetMapping("/cart")
    public String cart(){
        return "onlinePage/cart";
    }

    @GetMapping("/checkout")
    public String checkout(Authentication authentication, Model model){
        if(authentication != null){
            AccountDetailImpl accountDetail = (AccountDetailImpl) authentication.getPrincipal();
            model.addAttribute("auth", accountDetail);
        }else{
            model.addAttribute("auth", null);
        }
        return "onlinePage/checkout";
    }

    @PostMapping("/checkout")
    @ResponseBody
    public ResponseEntity<ResponseObject> checkoutAction(@RequestBody OrderTransactionDTO orderTransactionDTO, Authentication authentication){
        if("".equals(orderTransactionDTO.getUser_phone()) || orderTransactionDTO.getUser_phone() == null){
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","add order transaction Fail",""));
        }
        OrderTransaction orderTransaction = orderTransactionService.addTransaction(orderTransactionDTO, authentication);
        if(orderTransaction != null){
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","add order transaction Success", orderTransaction.getId()));
        }else{
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","add order transaction Fail",""));
        }
    }

    @GetMapping("confirmOrder")
    public String confirmOrder(@RequestParam(name = "id") Integer id, Model model){
        Optional<OrderTransaction> orderTransaction = orderTransactionRepository.findById(id);
        List<OrderTransactionDetail> orderTransactionDetail = orderTransactionDetailRepository.findAllByOrderTransaction(orderTransaction.get());
        List<ProductDTO> productDTOS = new ArrayList<>();
        for(OrderTransactionDetail o : orderTransactionDetail){
            Product product = productRepository.findById(o.getProduct_id()).get();
            ProductDTO p = new ProductDTO();
            p.setName(product.getName());
            p.setCode(product.getCode());
            p.setPrice(product.getPrice());
            p.setQuantity(o.getQuantity());
            p.setId(product.getId());
            productDTOS.add(p);
        }
        if(orderTransaction.isPresent()){
            model.addAttribute("transaction", orderTransaction.get());
            model.addAttribute("transactionDetail", productDTOS);
        }
        return "onlinePage/OrderSuccess";
    }




    @GetMapping("/detailProduct")
    public String detailProduct(@RequestParam(name = "id") String p_id, Model model){
        Optional<Product> product = productRepository.findById(Integer.parseInt(p_id));
        ProductDTO productDTO = new ProductDTO();
        if(product.isPresent()){
            productDTO.setId(product.get().getId());
            productDTO.setCode(product.get().getCode());
            productDTO.setName(product.get().getName());
            productDTO.setImage(product.get().getImage());
            productDTO.setOriginal_price(product.get().getOriginal_price());
            productDTO.setPrice(product.get().getPrice());
            productDTO.setQuantity(product.get().getQuantity());
            productDTO.setDescription(product.get().getDescription());
            productDTO.setAddedDate(product.get().getAddedDate());
            productDTO.setBrand(product.get().getBrand());
            productDTO.setCategories(product.get().getCategories());
        }
        model.addAttribute("products", productDTO);
        return "onlinePage/productdetail";
    }
    @GetMapping("/products")
    @ResponseBody
    public ResponseEntity<ResponseObject> getAllProduct(){
        List<Product> products = productRepository.findAll();
        List<ProductDTO> productDTOS = new ArrayList<>();
        for(Product product : products){
            ProductDTO p = new ProductDTO();
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

            productDTOS.add(p);
        }
        return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","get product success",productDTOS));
    }

    @GetMapping("/getProductById")
    @ResponseBody
    public ResponseEntity<ResponseObject> getProductById(@RequestParam(name = "id") Integer id){
        Optional<Product> product = productRepository.findById(id);
        if(product.isPresent()){
            ProductDTO p = new ProductDTO();
            p.setId(product.get().getId());
            p.setCode(product.get().getCode());
            p.setName(product.get().getName());
            p.setImage(product.get().getImage());
            p.setOriginal_price(product.get().getOriginal_price());
            p.setPrice(product.get().getPrice());
            p.setQuantity(product.get().getQuantity());
            p.setDescription(product.get().getDescription());
            p.setAddedDate(product.get().getAddedDate());
            p.setBrand(product.get().getBrand());
            p.setCategories(product.get().getCategories());

            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","get product success",p));
        }else{
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","product id is not exist",""));
        }
    }
}
