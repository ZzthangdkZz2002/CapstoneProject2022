package com.example.electriccomponentsshop.common;



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
}
