package com.example.electriccomponentsshop.sendOTP;

import com.fasterxml.jackson.annotation.JsonProperty;

public class SmsRequest {

    private final String phoneNumber;


    public SmsRequest(@JsonProperty("phoneNumber") String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }


    @Override
    public String toString() {
        return "SmsRequest{" +
                "phoneNumber='" + phoneNumber + '\'' +
                '}';
    }
}

