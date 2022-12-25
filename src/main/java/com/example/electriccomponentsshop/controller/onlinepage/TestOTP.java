package com.example.electriccomponentsshop.controller.onlinepage;

import com.example.electriccomponentsshop.sendOTP.SmsRequest;
import com.example.electriccomponentsshop.sendOTP.SmsSenderImpl;
import com.example.electriccomponentsshop.sendOTP.StoreOTPandPhoneNumber;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.UUID;

@RestController
@RequestMapping("api/v1")
public class TestOTP {

    @Autowired
    private final SmsSenderImpl smsSender;


    public TestOTP(SmsSenderImpl smsSender) {
        this.smsSender = smsSender;
    }


    @PostMapping("/sendSms")
    public void sendSms( @RequestBody SmsRequest smsRequest){
        smsSender.sendSms(smsRequest);
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