package com.example.electriccomponentsshop.controller.admin;

import com.example.electriccomponentsshop.common.OrderEnum;
import com.example.electriccomponentsshop.dto.*;
import com.example.electriccomponentsshop.entities.Account;
import com.example.electriccomponentsshop.entities.OrderTransaction;
import com.example.electriccomponentsshop.entities.OrderTransactionDetail;
import com.example.electriccomponentsshop.entities.Product;
import com.example.electriccomponentsshop.repositories.AccountRepository;
import com.example.electriccomponentsshop.repositories.OrderTransactionRepository;
import com.example.electriccomponentsshop.repositories.ProductRepository;
import com.example.electriccomponentsshop.services.*;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
    final
    EmailSenderService emailSenderService;

    @Autowired
    ProductRepository productRepository;
    @Autowired
    AccountRepository accountRepository;
//    @Autowired
//    OrderItemService orderItemService;
//    @Autowired
//    OrderKindService orderKindService;
//    @Autowired
//    SkuService skuService;
    @GetMapping("/{status}")
    public String viewAllOrderByEmployeeId(@PathVariable String status, @RequestParam(name="index",defaultValue = "0") String index, ModelMap model, Authentication authentication) {
        AccountDetailImpl accountDetail = (AccountDetailImpl) authentication.getPrincipal();
//        List<OrderTransaction> orderTransactions = new ArrayList<>();
        Page<OrderTransaction> orderTransactions = null;
        List<OrderTransactionDTO> orderTransactionDTOS= new ArrayList<>();
        String active = "";

        if (status.equals("waiting")) {
            orderTransactions = orderTransactionRepository.findAllByStatusOrderByCreatedDesc(OrderEnum.PENDING.getName(), PageRequest.of(Integer.parseInt(index),10));
            model.addAttribute("listOrder", orderTransactions.getContent());
            model.addAttribute("total",orderTransactions.getTotalPages());
//            orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            active = "waiting";
        } else if (status.equals("confirmed")) {
            orderTransactions = orderTransactionRepository.findAllByStatusOrderByCreatedDesc(OrderEnum.CONFIRM.getName(), PageRequest.of(Integer.parseInt(index),10));
            model.addAttribute("listOrder", orderTransactions.getContent());
            model.addAttribute("total",orderTransactions.getTotalPages());
//            orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            active = "confirmed";
        } else if (status.equals("shipping")) {
            orderTransactions = orderTransactionRepository.findAllByStatusOrderByCreatedDesc(OrderEnum.DELIVERY.getName(), PageRequest.of(Integer.parseInt(index),10));
            model.addAttribute("listOrder", orderTransactions.getContent());
            model.addAttribute("total",orderTransactions.getTotalPages());
//            orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            active = "shipping";
        } else if (status.equals("received")) {
            orderTransactions = orderTransactionRepository.findAllByStatusOrderByCreatedDesc(OrderEnum.DONE.getName(), PageRequest.of(Integer.parseInt(index),10));
            model.addAttribute("listOrder", orderTransactions.getContent());
            model.addAttribute("total",orderTransactions.getTotalPages());
//            orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            active = "received";
        } else if (status.equals("cancelled")) {
            orderTransactions = orderTransactionRepository.findAllByStatusOrderByCreatedDesc(OrderEnum.CANCEL.getName(), PageRequest.of(Integer.parseInt(index),10));
            model.addAttribute("listOrder", orderTransactions.getContent());
            model.addAttribute("total",orderTransactions.getTotalPages());
//            orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            active = "cancelled";
        } else if (status.equals("returned")) {
            orderTransactions = orderTransactionRepository.findAllByStatusOrderByCreatedDesc(OrderEnum.RETURNED.getName(), PageRequest.of(Integer.parseInt(index),10));
            model.addAttribute("listOrder", orderTransactions.getContent());
            model.addAttribute("total",orderTransactions.getTotalPages());
//            orderTransactionDTOS = convertOrderToDTO(orderTransactions);
            active = "returned";
        }

        model.addAttribute("active", active);
//        modelMap.addAttribute("listOrder", orderTransactions);

        return "administrator/order-management";
    }

    @GetMapping("search")
    public String searchProduct(@RequestParam(name = "status", required = false) String status,@RequestParam(name="text", required = false) String text, @RequestParam(name="index",defaultValue = "0") String index, ModelMap modelMap){
        int pIndex = Integer.parseInt(index);
        System.out.println("status: "+status);
        Page<OrderTransaction> orderTransactions = orderTransactionRepository.findAllByOrderidOrderByCreatedDesc(text,PageRequest.of(pIndex,10));

        modelMap.addAttribute("pageNo", 1);
        modelMap.addAttribute("listOrder", orderTransactions.getContent());
        modelMap.addAttribute("total", orderTransactions.getTotalPages());
        modelMap.addAttribute("text", text);


        return "administrator/order-management";
    }

    @GetMapping("/giaohangnhanh")
    public String OrderToGiaoHangNhanh(@RequestParam(name = "orderid") String orderid, ModelMap map){
        OrderTransaction orderTransaction = orderTransactionRepository.findByOrderid(orderid).get();
        OrderTransactionDTO orderTransactionDTO = convertOrderToDTO2(orderTransaction);
        map.addAttribute("order",orderTransactionDTO);
        return "administrator/giaohangnhanh";
    }

    @GetMapping("/updateGHN")
    public String updateGiaoHangNhanh(@RequestParam(name = "orderid") String orderid, ModelMap map){
        OrderTransaction orderTransaction = orderTransactionRepository.findByOrderid(orderid).get();
        OrderTransactionDTO orderTransactionDTO = convertOrderToDTO2(orderTransaction);
        map.addAttribute("order",orderTransactionDTO);
        return "administrator/updateGiaoHangNhanh";
    }
    @GetMapping("/cancelGHN")
    public String cancelGiaoHangNhanh(@RequestParam(name = "orderid") String orderid, ModelMap map){
        OrderTransaction orderTransaction = orderTransactionRepository.findByOrderid(orderid).get();
        orderTransaction.setIsShipping(false);
        orderTransaction.setOrder_code(null);
        orderTransactionRepository.save(orderTransaction);
        map.addAttribute("active","shipping");
        return "redirect:/admin/orders/shipping";
    }

    @GetMapping("getOrder")
    @ResponseBody
    public ResponseEntity<ResponseObject> getOrderTransaction(@RequestParam(name = "id") String id){
        OrderTransaction orderTransaction = orderTransactionRepository.findById(Integer.parseInt(id)).get();
        OrderTransactionDTO orderTransactionDTO = convertOrderToDTO2(orderTransaction);
        return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","get order success",orderTransactionDTO));
    }

    @GetMapping("updateIsShip")
    public ResponseEntity<ResponseObject> updateIsShip(@RequestParam(name = "id") String id, @RequestParam(name = "order_code") String order_code){
        OrderTransaction orderTransaction = orderTransactionRepository.findById(Integer.parseInt(id)).get();
        orderTransaction.setIsShipping(true);
        orderTransaction.setOrder_code(order_code);
        orderTransactionRepository.save(orderTransaction);
        return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","update is shipping success",""));
    }

    public List<OrderTransactionDTO> convertOrderToDTO(List<OrderTransaction> orderTransactions){
        List<OrderTransactionDTO> orderTransactionDTOS = new ArrayList<>();
        if(orderTransactions != null){
            for(OrderTransaction orderTransaction: orderTransactions){
                OrderTransactionDTO orderTransactionDTO = new OrderTransactionDTO();
                if(orderTransaction.getCustomer() != null){
                    CustomerDTO customerDTO = new CustomerDTO();
                    customerDTO.setId(orderTransaction.getCustomer().getId());
                    if(orderTransaction.getCustomer().getName() != null){
                        customerDTO.setName(orderTransaction.getCustomer().getName());
                    }
                    if(orderTransaction.getCustomer().getEmail() != null){
                        customerDTO.setEmail(orderTransaction.getCustomer().getEmail());
                    }
                    if(orderTransaction.getCustomer().getAddress() != null){
                        customerDTO.setAddress(orderTransaction.getCustomer().getAddress());
                    }
                    if(orderTransaction.getCustomer().getPhone() != null){
                        customerDTO.setPhone(orderTransaction.getCustomer().getPhone());
                    }
                    if(orderTransaction.getCustomer().getGender() != null){
                        customerDTO.setGender(orderTransaction.getCustomer().getGender());
                    }
                    orderTransactionDTO.setCustomer(customerDTO);
                }
                orderTransactionDTO.setId(orderTransaction.getId());
                orderTransactionDTO.setOrderid(orderTransaction.getOrderid());
                orderTransactionDTO.setStatus(orderTransaction.getStatus());
                orderTransactionDTO.setIsShipping(orderTransaction.getIsShipping());
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
                if(orderTransaction.getAccountemployee() != null){
                    orderTransactionDTO.setAccount_employee(orderTransaction.getAccountemployee());
                }

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

    public OrderTransactionDTO convertOrderToDTO2(OrderTransaction orderTransaction){
        try{
            if(orderTransaction != null){
                OrderTransactionDTO orderTransactionDTO = new OrderTransactionDTO();
                orderTransactionDTO.setId(orderTransaction.getId());
                orderTransactionDTO.setOrderid(orderTransaction.getOrderid());
                orderTransactionDTO.setStatus(orderTransaction.getStatus());
                orderTransactionDTO.setIsShipping(orderTransaction.getIsShipping());
                if(orderTransaction.getOrder_code() != null){
                    orderTransactionDTO.setOrder_code(orderTransaction.getOrder_code());
                }
                if(orderTransaction.getCustomer() != null){
                    CustomerDTO customerDTO = new CustomerDTO();
                    customerDTO.setId(orderTransaction.getCustomer().getId());
                    if(orderTransaction.getCustomer().getName() != null){
                        customerDTO.setName(orderTransaction.getCustomer().getName());
                    }
                    if(orderTransaction.getCustomer().getEmail() != null){
                        customerDTO.setEmail(orderTransaction.getCustomer().getEmail());
                    }
                    if(orderTransaction.getCustomer().getAddress() != null){
                        customerDTO.setAddress(orderTransaction.getCustomer().getAddress());
                    }
                    if(orderTransaction.getCustomer().getPhone() != null){
                        customerDTO.setPhone(orderTransaction.getCustomer().getPhone());
                    }
                    if(orderTransaction.getCustomer().getGender() != null){
                        customerDTO.setGender(orderTransaction.getCustomer().getGender());
                    }
                    if(orderTransaction.getCustomer().getProvince() != null){
                        customerDTO.setProvince(orderTransaction.getCustomer().getProvince());
                    }
                    if(orderTransaction.getCustomer().getDistrict() != null){
                        customerDTO.setDistrict(orderTransaction.getCustomer().getDistrict());
                    }
                    if(orderTransaction.getCustomer().getWard() != null){
                        customerDTO.setWard(orderTransaction.getCustomer().getWard());
                    }

                    orderTransactionDTO.setCustomer(customerDTO);
//                    orderTransactionDTO.setCustomer(orderTransaction.getCustomer());
                }
//                orderTransactionDTO.setUser_name(orderTransaction.getUser_name());
//                orderTransactionDTO.setUser_email(orderTransaction.getUser_email());
//                orderTransactionDTO.setUser_phone(orderTransaction.getUser_phone());
                orderTransactionDTO.setAddress(orderTransaction.getAddress());
                orderTransactionDTO.setProvince(orderTransaction.getProvince());
                orderTransactionDTO.setDistrict(orderTransaction.getDistrict());
                orderTransactionDTO.setWard(orderTransaction.getWard());
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

    @GetMapping("/finish")
    public String finishOrder(@RequestParam(name = "id") String id, RedirectAttributes r, Authentication authentication){
        try{
            OrderTransaction orderTransaction = orderTransactionRepository.findById(Integer.parseInt(id)).get();
            orderTransaction.setStatus(OrderEnum.DONE.getName());
            if(!orderTransaction.getIsPaid()){
                orderTransaction.setIsPaid(true);
            }
            orderTransaction.setUpdatedDate(new Date());
            AccountDetailImpl accountDetail = (AccountDetailImpl) authentication.getPrincipal();
            Account account = accountRepository.findById(accountDetail.getId()).get();
            orderTransaction.setEmployeeProcessor(account);
            orderTransactionRepository.save(orderTransaction);
            r.addFlashAttribute("acceptOrderMessage","Giao thành công đơn hàng #" + orderTransaction.getOrderid());
        }catch (Exception e){
            r.addFlashAttribute("acceptOrderMessage","error");
        }
        return "redirect:/admin/orders/received";
    }

    @GetMapping("/accept")
    public String acceptOrder(@RequestParam(name = "id") String id, RedirectAttributes r, Authentication authentication){
        try{
            OrderTransaction orderTransaction = orderTransactionRepository.findById(Integer.parseInt(id)).get();
            orderTransaction.setStatus(OrderEnum.CONFIRM.getName());
            orderTransaction.setUpdatedDate(new Date());
            AccountDetailImpl accountDetail = (AccountDetailImpl) authentication.getPrincipal();
            Account account = accountRepository.findById(accountDetail.getId()).get();
            orderTransaction.setEmployeeProcessor(account);
            orderTransactionRepository.save(orderTransaction);
            r.addFlashAttribute("acceptOrderMessage","Xác nhận thành công đơn hàng #" + orderTransaction.getOrderid());
        }catch (Exception e){
            r.addFlashAttribute("acceptOrderMessage","error");
        }
        return "redirect:/admin/orders/confirmed";
    }

    @GetMapping("/cancel")
    public ResponseEntity<ResponseObject> cancelOrder(@RequestParam(name = "id") String id, @RequestParam(name = "reason") String reason, Authentication authentication){
        try{
            System.out.println("Reason: "+ reason);
            String buildEmail =
                    "<meta charset=\"UTF-8\">"+
                            "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">"+
                 "<div style=\"font-family:Helvetica,Arial,sans-serif;font-size:16px;margin:0;color:#0b0c0c\">\n" +
                        "\n" +
                        "<span style=\"display:none;font-size:1px;color:#fff;max-height:0\"></span>\n" +
                        "\n" +
                        "  <table role=\"presentation\" width=\"100%\" style=\"border-collapse:collapse;min-width:100%;width:100%!important\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n" +
                        "    <tbody><tr>\n" +
                        "      <td width=\"100%\" height=\"53\" bgcolor=\"#0b0c0c\">\n" +
                        "        \n" +
                        "        <table role=\"presentation\" width=\"100%\" style=\"border-collapse:collapse;max-width:580px\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" align=\"center\">\n" +
                        "          <tbody><tr>\n" +
                        "            <td width=\"70\" bgcolor=\"#0b0c0c\" valign=\"middle\">\n" +
                        "                <table role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse\">\n" +
                        "                  <tbody><tr>\n" +
                        "                    <td style=\"padding-left:10px\">\n" +
                        "                  \n" +
                        "                    </td>\n" +
                        "                    <td style=\"font-size:28px;line-height:1.315789474;Margin-top:4px;padding-left:10px\">\n" +
                        "                      <span style=\"font-family:Helvetica,Arial,sans-serif;font-weight:700;color:#ffffff;text-decoration:none;vertical-align:top;display:inline-block\">Đơn hàng #%orderid% đã bị hủy</span>\n" +
                        "                    </td>\n" +
                        "                  </tr>\n" +
                        "                </tbody></table>\n" +
                        "              </a>\n" +
                        "            </td>\n" +
                        "          </tr>\n" +
                        "        </tbody></table>\n" +
                        "        \n" +
                        "      </td>\n" +
                        "    </tr>\n" +
                        "  </tbody></table>\n" +
                        "  <table role=\"presentation\" class=\"m_-6186904992287805515content\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse;max-width:580px;width:100%!important;margin-top:100px\" width=\"100%\">\n" +
                        "    <tbody><tr>\n" +
                        "      <td width=\"10\" height=\"10\" valign=\"middle\"></td>\n" +
                        "      <td>\n" +
                        "        \n" +
                        "                <table role=\"presentation\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse\">\n" +
                        "                  <tbody><tr>\n" +
                        "                    <td bgcolor=\"#1D70B8\" width=\"100%\" height=\"10\"></td>\n" +
                        "                  </tr>\n" +
                        "                </tbody></table>\n" +
                        "        \n" +
                        "      </td>\n" +
                        "      <td width=\"10\" valign=\"middle\" height=\"10\"></td>\n" +
                        "    </tr>\n" +
                        "  </tbody></table>\n" +
                        "\n" +
                        "\n" +
                        "\n" +
                        "  <table role=\"presentation\" class=\"m_-6186904992287805515content\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse;max-width:580px;width:100%!important\" width=\"100%\">\n" +
                        "    <tbody><tr>\n" +
                        "      <td height=\"30\"><br></td>\n" +
                        "    </tr>\n" +
                        "    <tr>\n" +
                        "      <td width=\"10\" valign=\"middle\"><br></td>\n" +
                        "      <td style=\"font-family:Helvetica,Arial,sans-serif;font-size:19px;line-height:1.315789474;max-width:560px\">\n" +
                        "        \n" +
                        "            <p style=\"Margin:0 0 20px 0;font-size:19px;line-height:25px;color:#0b0c0c\">Hi " + "%username%" + ",</p><p style=\"Margin:0 0 20px 0;font-size:19px;line-height:25px;color:#0b0c0c\"> Cảm ơn bạn đã mua hàng tại Electrico. Chúng tôi rất tiêc phải thông báo với bạn rằng đơn hàng của bạn đã bị hủy với lý do:  </p><blockquote style=\"Margin:0 0 20px 0;border-left:10px solid #b1b4b6;padding:15px 0 0.1px 15px;font-size:19px;line-height:25px\"><p style=\"Margin:0 0 20px 0;font-size:19px;line-height:25px;color:#0b0c0c\"> <a href=\"" + "%link%" + "\">%reason%</a> </p></blockquote>\n Chúng tôi rất tiếc vì sự bất tiện này. Rất vui lòng được phục vụ quý khách . <p>See you soon</p>" +
                        "        \n" +
                        "      </td>\n" +
                        "      <td width=\"10\" valign=\"middle\"><br></td>\n" +
                        "    </tr>\n" +
                        "    <tr>\n" +
                        "      <td height=\"30\"><br></td>\n" +
                        "    </tr>\n" +
                        "  </tbody></table><div class=\"yj6qo\"></div><div class=\"adL\">\n" +
                        "\n" +
                        "</div></div>";
            OrderTransaction orderTransaction = orderTransactionRepository.findById(Integer.parseInt(id)).get();
            orderTransaction.setStatus(OrderEnum.CANCEL.getName());
            orderTransaction.setUpdatedDate(new Date());
            AccountDetailImpl accountDetail = (AccountDetailImpl) authentication.getPrincipal();
            Account account = accountRepository.findById(accountDetail.getId()).get();
            orderTransaction.setEmployeeProcessor(account);
            if(orderTransaction.getIsPaid() == true){
                orderTransaction.setIsPaid(false);
            }
            buildEmail = buildEmail.replace("%orderid%", orderTransaction.getOrderid());
            if(orderTransaction.getUser_name() != null){
                buildEmail = buildEmail.replace("%username%", orderTransaction.getUser_name());
            }else{
                buildEmail = buildEmail.replace("%username%", "bạn");
            }
            buildEmail = buildEmail.replace("%reason%",reason);
            if(orderTransaction.getUser_email() != null){
                emailSenderService.sendMail(orderTransaction.getUser_email(),buildEmail,"Đơn hàng mua tại Electrico của bạn đã bị hủy");
            }
            orderTransactionRepository.save(orderTransaction);
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","Hủy đơn hàng thành công",""));
//            r.addFlashAttribute("acceptOrderMessage","Hủy thành công đơn hàng #" + orderTransaction.getOrderid());
        }catch (Exception e){
            System.out.println("Cancel exception: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","Hủy đơn hàng thất bại",""));
//            r.addFlashAttribute("acceptOrderMessage","error");
        }
//        return "redirect:/admin/orders/cancelled";
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
    @GetMapping("/view/{id}")

    public String viewOrder(@PathVariable String id, Model modelMap) {
        try {
            OrderTransaction orderTransaction = orderTransactionRepository.findById(Integer.parseInt(id)).get();
            OrderTransactionDTO orderTransactionDTO = convertOrderToDTO2(orderTransaction);
//            OrderDTO orderDTO = orderService.findById(orderId);
            modelMap.addAttribute("orderDto", orderTransactionDTO);
            return "administrator/order-detail";
        } catch (NumberFormatException | NoSuchElementException e) {
            modelMap.addAttribute("notFound", e.getMessage());
            return "administrator/order-detail";
        }

    }
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
    @GetMapping("/orderOffline")
    public String viewAddForm(ModelMap model) {
        try{
//            List<ProductDTO> productDTOList = productService.findAll();
//            List<OrderKindDTO> orderTypeList = orderKindService.findAll();
//            model.addAttribute("listProduct", productDTOList);
//            model.addAttribute("listType", orderTypeList);
//            getAddress(model);
        }
        catch (NoSuchElementException e){
            System.out.println(e.getMessage()+"ff");
            model.addAttribute("notFound", e.getMessage());

        }

        return "administrator/order-offline";
    }

    @PostMapping("/orderOffline")
    @ResponseBody
    public ResponseEntity<ResponseObject> addOrderOffline(@RequestBody OrderTransactionDTO orderTransactionDTO, Authentication authentication){
        try{
            if("".equals(orderTransactionDTO.getAmount()) || "0".equals(orderTransactionDTO.getAmount()) || orderTransactionDTO.getAmount() == null){
                return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","add order transaction fail",""));
            }else{
                OrderTransaction orderTransaction = orderTransactionService.addTransactionOffline(orderTransactionDTO, authentication);
                if(orderTransaction != null){
                    return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","add order transaction Success", orderTransaction.getId()));
                }else{
                    return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("02","add order transaction fail",""));
                }
            }
        }catch (Exception e){
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("03","add order transaction fail",e.getMessage()));
        }
    }

//    @PostMapping("/addOrder")
//    @ResponseBody
//    public ResponseEntity<ResponseObject> addOrderOffline(@RequestBody OrderTransactionDTO orderTransactionDTO){
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
