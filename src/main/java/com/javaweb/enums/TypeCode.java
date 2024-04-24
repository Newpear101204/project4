package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum TypeCode {
    TANG_TRET("Tầng trệt"),
    NGUYEN_CAN("Nguyên căn"),
    NOI_THAT("Nội thất")
    ;

    private final String typdeCode;

    TypeCode(String typdeCode) {
        this.typdeCode = typdeCode;
    }

    public static Map<String, String> typecode(){
        Map<String, String> listType = new TreeMap<>();
        for (TypeCode it : TypeCode.values()){
            listType.put(it.toString(), it.typdeCode);
        }
        return listType;
    }
}
