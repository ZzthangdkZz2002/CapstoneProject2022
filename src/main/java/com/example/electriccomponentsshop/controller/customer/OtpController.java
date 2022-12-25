package com.example.electriccomponentsshop.controller.customer;

import com.example.electriccomponentsshop.dto.ResponseObject;
import com.example.electriccomponentsshop.entities.OrderTransaction;
import com.example.electriccomponentsshop.repositories.OrderTransactionRepository;
import com.example.electriccomponentsshop.sendOTP.SmsRequest;
import com.example.electriccomponentsshop.sendOTP.SmsSenderImpl;
import com.example.electriccomponentsshop.sendOTP.StoreOTPandPhoneNumber;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@RestController
@RequestMapping("/api/sms")
public class OtpController {

    @Autowired
    private final SmsSenderImpl smsSender;

    @Autowired
    OrderTransactionRepository orderTransactionRepository;

    public OtpController(SmsSenderImpl smsSender) {
        this.smsSender = smsSender;
    }


    @PostMapping("/sendSms")
    public ResponseEntity<ResponseObject> sendSms(@RequestBody SmsRequest smsRequest){
        try{
//            String phone = smsSender.getCorrectPhoneNumber(smsRequest.getPhoneNumber());
            List<OrderTransaction> orderTransactions = orderTransactionRepository.findAllByUserphone(smsRequest.getPhoneNumber());
            if(orderTransactions == null || orderTransactions.size() <= 0){
                return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","Số điện thoại của bạn không có trong hệ thống",""));
            }
            String otp = smsSender.sendSms(smsRequest);
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("00","get otp success",otp));
        }catch (Exception e){
            System.out.println("otp error: "+ e.getMessage());
            return ResponseEntity.status(HttpStatus.OK).body(new ResponseObject("01","get otp fail",e.getMessage()));
        }
    }
    @PostMapping("/verify")
    public String verifyOTP( @RequestParam("otp") String otp){
        if(otp.equals(StoreOTPandPhoneNumber.getOtp())){
            StoreOTPandPhoneNumber.setOtp(UUID.randomUUID().toString());
            return "Correct OTP";
        }else{
            return "OTP are not correct!!";
        }
    }
}