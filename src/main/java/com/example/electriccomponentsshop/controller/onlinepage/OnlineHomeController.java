package com.example.electriccomponentsshop.controller.onlinepage;

import com.example.electriccomponentsshop.common.PaymentConfig;
import com.example.electriccomponentsshop.dto.OrderTransactionDTO;
import com.example.electriccomponentsshop.dto.PaymentDTO;
import com.example.electriccomponentsshop.dto.ProductDTO;
import com.example.electriccomponentsshop.dto.ResponseObject;
import com.example.electriccomponentsshop.entities.Category;
import com.example.electriccomponentsshop.entities.OrderTransaction;
import com.example.electriccomponentsshop.entities.OrderTransactionDetail;
import com.example.electriccomponentsshop.entities.Product;
import com.example.electriccomponentsshop.repositories.CategoryRepository;
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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@AllArgsConstructor
@CrossOrigin
@Controller
@RequestMapping("/homepage")
public class OnlineHomeController {

    final ProductService productService;

    final OrderTransactionService orderTransactionService;

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    OrderTransactionDetailRepository orderTransactionDetailRepository;

    @Autowired
    OrderTransactionRepository orderTransactionRepository;

    @Autowired
    final ProductRepository productRepository;

    @GetMapping("")
    public String homePage(ModelMap map){
        List<Category> categories = categoryRepository.findNoneParent();
        map.addAttribute("categories", categories);
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

    @PostMapping("re-payment")
    public ResponseEntity<ResponseObject> rePayment(@RequestParam(value = "orderid", required = false) String orderid ) throws UnsupportedEncodingException {
        OrderTransaction orderTransaction = orderTransactionRepository.findByOrderid(orderid).get();
        int amount = (int)orderTransaction.getAmount() * 100;
        Map vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", PaymentConfig.VERSION);
        vnp_Params.put("vnp_Command", PaymentConfig.COMMAND);
        vnp_Params.put("vnp_TmnCode", PaymentConfig.vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_TxnRef", orderid + PaymentConfig.getRandomNumber(6));
        if(orderTransaction.getMessage() == null || "".equals(orderTransaction.getMessage())){
            vnp_Params.put("vnp_OrderInfo", "Electronic Shop - Thanh toan hoa don");
        }else{
            vnp_Params.put("vnp_OrderInfo", orderTransaction.getMessage());
        }
        vnp_Params.put("vnp_OrderType", PaymentConfig.ORDER_TYPE);
        vnp_Params.put("vnp_Locale", "vn");
        vnp_Params.put("vnp_ReturnUrl", PaymentConfig.vnp_Returnurl);
        vnp_Params.put("vnp_IpAddr", "127.0.0.1");
        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());

        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        //Build data to hash and querystring
        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = PaymentConfig.hmacSHA512(PaymentConfig.vnp_HashSecret, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = PaymentConfig.vnp_PayUrl + "?" + queryUrl;
        System.out.println("URL: " + paymentUrl);
//        orderTransaction.setOrderid(randomNumber);
//        orderTransactionRepository.save(orderTransaction);
        return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","Create payment success",paymentUrl));
    }

    @PostMapping("/create-payment")
    public ResponseEntity<ResponseObject> createPayment(@RequestBody OrderTransactionDTO orderTransactionDTO, Authentication authentication) throws UnsupportedEncodingException {
        int amount = Integer.parseInt(orderTransactionDTO.getAmount()) * 100;
        String orderid = PaymentConfig.getRandomNumber(3);
        OrderTransaction orderTransaction = orderTransactionService.addTransactionOnline(orderTransactionDTO, authentication, orderid);
        Map vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", PaymentConfig.VERSION);
        vnp_Params.put("vnp_Command", PaymentConfig.COMMAND);
        vnp_Params.put("vnp_TmnCode", PaymentConfig.vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_TxnRef", orderTransaction.getOrderid());
        if(orderTransactionDTO.getMessage() == null || "".equals(orderTransactionDTO.getMessage())){
            vnp_Params.put("vnp_OrderInfo", "Electronic Shop - Thanh toan hoa don");
        }else{
            vnp_Params.put("vnp_OrderInfo", orderTransactionDTO.getMessage());
        }
        vnp_Params.put("vnp_OrderType", PaymentConfig.ORDER_TYPE);
        vnp_Params.put("vnp_Locale", "vn");
        vnp_Params.put("vnp_ReturnUrl", PaymentConfig.vnp_Returnurl);
        vnp_Params.put("vnp_IpAddr", "127.0.0.1");
        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));

        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());

        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        //Build data to hash and querystring
        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = PaymentConfig.hmacSHA512(PaymentConfig.vnp_HashSecret, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = PaymentConfig.vnp_PayUrl + "?" + queryUrl;
        System.out.println("URL: " + paymentUrl);

        if("".equals(orderTransactionDTO.getUser_phone()) || orderTransactionDTO.getUser_phone() == null){
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","add order transaction Fail",""));
        }
        if(orderTransaction != null){
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","Create payment success",paymentUrl));
        }else{
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","add order transaction Fail",""));
        }
    }

    @GetMapping("payment-result")
    public String paymentResult(@RequestParam(value = "vnp_ResponseCode") String response_code, @RequestParam(value = "vnp_Amount",required = false) String amount,
                              @RequestParam(value = "vnp_BankCode", required = false) String bank_code, @RequestParam(value = "vnp_BankTranNo", required = false) String BankTranNo,
                              @RequestParam(value = "vnp_PayDate", required = false) String payDate, @RequestParam(value = "vnp_OrderInfo", required = false) String order_infor,
                              @RequestParam(value = "vnp_TransactionNo", required = false) String Trans_no, @RequestParam(value = "vnp_TransactionStatus", required = false) String trans_status,
                              @RequestParam(value = "vnp_TxnRef") String orderid, RedirectAttributes r)
    {
        String correctOrderid="";
        if(orderid.length() > 6){
            correctOrderid = orderid.substring(0,6);
        }else{
            correctOrderid = orderid;
        }
        Optional<OrderTransaction> orderTransaction = orderTransactionRepository.findByOrderid(correctOrderid);
        if("00".equals(response_code)){
            if(orderTransaction.isPresent()){
                orderTransaction.get().setIsPaid(true);
                orderTransactionRepository.save(orderTransaction.get());
                r.addFlashAttribute("ordermessage","Đã thanh toán");
                return "redirect:/homepage/confirmOrder?id="+orderTransaction.get().getId();
            }else{
                r.addFlashAttribute("ordermessage","Thanh toán không thành công. Đơn hàng không tồn tại");
                return "redirect:/homepage/confirmOrder?id="+orderTransaction.get().getId();
            }
        }else{
            r.addFlashAttribute("ordermessage","Thanh toán không thành công");
            return "redirect:/homepage/confirmOrder?id="+orderTransaction.get().getId();
        }
    }

    @PostMapping("/checkout")
    @ResponseBody
    public ResponseEntity<ResponseObject> checkoutAction(@RequestBody OrderTransactionDTO orderTransactionDTO, Authentication authentication){
        if("".equals(orderTransactionDTO.getUser_phone()) || orderTransactionDTO.getUser_phone() == null){
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","add order transaction Fail",""));
        }
        OrderTransaction orderTransaction = orderTransactionService.addTransactionOnline(orderTransactionDTO, authentication,"");
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
        List<Product> products = productRepository.findByStatus(1);
        List<ProductDTO> productDTOS = new ArrayList<>();
        for(Product product : products){
            ProductDTO p = new ProductDTO();
            p.setId(product.getId());
            p.setCode(product.getCode());
            p.setName(product.getName());
            p.setUnit(product.getUnit());
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
