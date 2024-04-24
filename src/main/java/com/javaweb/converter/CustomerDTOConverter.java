package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.StatusType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

@Component
public class CustomerDTOConverter{

        @Autowired
        private ModelMapper modelMapper;

    public ResponseDTO ConverterToResponseDTO (List<UserEntity> staffs , List<UserEntity> staffAssignment){
        List<StaffResponseDTO>  staffResponseDTOS = new ArrayList<>();
        ResponseDTO a = new ResponseDTO();
        for (UserEntity it : staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());
            if(staffAssignment.contains(it)){
                staffResponseDTO.setChecked("checked");
            }
            else{
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        a.setData(staffResponseDTOS);
        a.setMessage("success");
        return a;
    }

    public CustomerDTO ConverterCustomerEntity (CustomerEntity customerEntity){
        CustomerDTO customerDTO = modelMapper.map(customerEntity,CustomerDTO.class);
        customerDTO.setName(customerEntity.getFullname());
        return customerDTO;
    }
    public CustomerEntity ConverterCUstomerDTO(CustomerDTO customerDTO){
        CustomerEntity customerEntity = modelMapper.map(customerDTO,CustomerEntity.class);
        customerEntity.setFullname(customerDTO.getName());
        Map<String,String> status = StatusType.statusType();
        String statusType = status.get(customerDTO.getStatus());
        customerEntity.setStatus(statusType);
        customerEntity.setIsactive(1);
        return customerEntity;
    }

    public String Status (String s){
        Map<String,String> listStatus = StatusType.statusType();
        for (Map.Entry<String,String > entry : listStatus.entrySet()) {
            String value = entry.getValue();
            if(value.equalsIgnoreCase(s)){
                return entry.getKey();
            }
        }
        return null;

    }
}
