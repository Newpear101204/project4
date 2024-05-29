package com.javaweb.ControllerAdvice;

import com.javaweb.exception.DistrictException;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice

public class CustomException extends ResponseEntityExceptionHandler{
    @ExceptionHandler(DistrictException.class)
    public ResponseEntity<Object> DistrictExceptionHandle (DistrictException ex , WebRequest request){
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setMessage(ex.getMessage());
        responseDTO.setDetail("Hãy chọn địa chỉ quậ cho tòa nhà ");
        return new ResponseEntity<>(responseDTO, HttpStatus.BAD_GATEWAY);

    }

}
