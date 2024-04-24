package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum Districts {
    QUAN_1("Quận 1"),
    QUAN_2("Quận 2"),
    QUAN_3("Quận 3"),
    QUAN_4("Quận 4");
     private final String districtName;

    Districts(String districtName) {
        this.districtName = districtName;
    }

    public static Map<String, String> type(){
        Map<String,String> districts = new TreeMap<>();
        for(Districts it : Districts.values()){
            districts.put(it.toString(), it.districtName);
        }
        return districts;
    }
}
