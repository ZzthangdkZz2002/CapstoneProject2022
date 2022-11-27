package com.example.electriccomponentsshop.common;


import com.example.electriccomponentsshop.entities.OrderTransaction;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.Random;

public class Utils {

    public String generateProductCode(Integer p_id){
        StringBuffer strCode = new StringBuffer("SP");
        if(String.valueOf(p_id).length() == 1){
            strCode.append("00000");
        }
        if(String.valueOf(p_id).length() == 2){
            strCode.append("0000");
        }
        if(String.valueOf(p_id).length() == 3){
            strCode.append("000");
        }
        if(String.valueOf(p_id).length() == 4){
            strCode.append("00");
        }
        if(String.valueOf(p_id).length() == 5){
            strCode.append("0");
        }
        strCode.append(p_id);

        return strCode.toString();
    }

    public String generateInventoryCode(Integer inventory_id){
        StringBuffer strCode = new StringBuffer("NK");
        if(String.valueOf(inventory_id).length() == 1){
            strCode.append("00000");
        }
        if(String.valueOf(inventory_id).length() == 2){
            strCode.append("0000");
        }
        if(String.valueOf(inventory_id).length() == 3){
            strCode.append("000");
        }
        if(String.valueOf(inventory_id).length() == 4){
            strCode.append("00");
        }
        if(String.valueOf(inventory_id).length() == 5){
            strCode.append("0");
        }
        strCode.append(inventory_id);

        return strCode.toString();
    }

    public String gererateOrderid(String orderid_increment){
        StringBuffer strCode = new StringBuffer();
        String random_code = getRandomNumber(3);
        strCode.append(random_code);
        strCode.append(orderid_increment);
        return strCode.toString();
    }

    public String getRandomNumber(int len) {
        Random rnd = new Random();
        String chars = "0123456789";
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(chars.charAt(rnd.nextInt(chars.length())));
        }
        return sb.toString();
    }

}
