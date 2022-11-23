package com.example.electriccomponentsshop.sendOTP;

public interface SmsSender {
    String sendSms(SmsRequest smsRequest);
    String getCorrectPhoneNumber(String phone);
}

