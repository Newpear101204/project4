package com.javaweb.utils;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Component
public class UploadFileUtils {

    public void writeOrUpdate(String path, byte[] bytes) {
        path = "C://home/office" + path;
        // đối tượng File mới với đường dẫn được trích xuất từ biến path trả về phần đường dẫn trước dấu gạch chéo cuối cùng
        File file = new File(StringUtils.substringBeforeLast(path, "/"));
        if (!file.exists()) {
            //  tạo thư mục.
            file.mkdir();
        }
        // tạo một luồng FileOutputStream để ghi dữ liệu từ mảng byte vào tệp tin được chỉ định bởi biến path
        try (FileOutputStream fop = new FileOutputStream(path)) {
            fop.write(bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
