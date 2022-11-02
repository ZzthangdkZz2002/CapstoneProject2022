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
        StringBuffer strCode = new StringBuffer("KK");
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

    public String gererateOrderid(){
        Random generator = new Random();
        int randomNumber = generator.nextInt((9 - 0) + 1) + 0;

       int hour = LocalDateTime.now().getHour();
       int minute = LocalDateTime.now().getMinute();
       int second = LocalDateTime.now().getSecond() + randomNumber;

       String str = String.valueOf(hour) + String.valueOf(minute) + String.valueOf(second);

       return str;

    }

}
