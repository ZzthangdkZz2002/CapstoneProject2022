package com.example.electriccomponentsshop.sendOTP;

public class StoreOTPandPhoneNumber {
    private static String otp;
    private static String phoneNumber;

    public static String getOtp() {
        return otp;
    }

    public static void setOtp(String otp) {
        StoreOTPandPhoneNumber.otp = otp;
    }

    public static String getPhoneNumber() {
        return phoneNumber;
    }

    public static void setPhoneNumber(String phoneNumber) {
        StoreOTPandPhoneNumber.phoneNumber = phoneNumber;
    }
}