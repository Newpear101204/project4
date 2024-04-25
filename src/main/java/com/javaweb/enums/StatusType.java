package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum StatusType {
    DANG_XU_LI("Đang xử lí"),
    DA_XU_LI("Đã xử lí"),
    CHUA_XU_LI("Chưa xử lí");

    private final String Status;

    StatusType(String Status){
        this.Status= Status;
    }

    public static Map<String,String> statusType (){
        Map<String,String> listStatus = new TreeMap<>();
        for( StatusType it : StatusType.values()){
            listStatus.put(it.toString(),it.Status);
        }
        return listStatus;
    }

}
