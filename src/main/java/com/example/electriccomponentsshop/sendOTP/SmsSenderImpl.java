package com.example.electriccomponentsshop.sendOTP;

import com.twilio.rest.api.v2010.account.Message;
import com.twilio.rest.api.v2010.account.MessageCreator;
import com.twilio.type.PhoneNumber;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service()
public class SmsSenderImpl implements SmsSender{

    private static final Logger LOGGER = LoggerFactory.getLogger(SmsSenderImpl.class);

    private final TwilioConfiguration twilioConfiguration;

    @Autowired
    public SmsSenderImpl(TwilioConfiguration twilioConfiguration) {
        this.twilioConfiguration = twilioConfiguration;
    }

    @Override
    public String sendSms(SmsRequest smsRequest) {
        String phone = getCorrectPhoneNumber(smsRequest.getPhoneNumber());
            PhoneNumber to = new PhoneNumber(phone);
            PhoneNumber from = new PhoneNumber(twilioConfiguration.getTrialNumber());
            String otp = this.generateOTP();
            String message = "FPT Education Electric Shop - Mã OTP của bạn là - "+otp+". Vui lòng nhập OTP để tra cứu đơn hàng.";
            MessageCreator creator = Message.creator(to, from, message);
            creator.create();

            StoreOTPandPhoneNumber.setOtp(otp);
            StoreOTPandPhoneNumber.setPhoneNumber(phone);
            System.out.println("Send sms: Phone: " +phone + ", OTP: "+otp);
            return otp;

    }

    @Override
    public String getCorrectPhoneNumber(String phone) {
        if(phone.charAt(0) == '0'){
            String result = "+84".concat(phone.substring(1));
            return result;
        }
        return phone;
    }


    public String generateOTP(){
        int min = 100000;
        int max = 999999;
        int otp = (int)(Math.random()*(max-min+1)+min);
        return String.valueOf(otp);
    }
}