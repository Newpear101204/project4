package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.StatusType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.CustomerRepository;
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

        @Autowired
        private CustomerRepository customerRepository;

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

    public CustomerSearchResponse ConverterCustomerEntity (CustomerEntity customerEntity){
        CustomerSearchResponse customerSearchResponse = modelMapper.map(customerEntity,CustomerSearchResponse.class);
        customerSearchResponse.setName(customerEntity.getFullname());
        Map<String,String> status = StatusType.statusType();
        if(customerEntity.getStatus()!=null)customerSearchResponse.setStatus(status.get(customerEntity.getStatus()));
        return customerSearchResponse;
    }

    public CustomerDTO ConverterCustomerEntityToDTO (CustomerEntity customerEntity){
        CustomerDTO customerDTO = modelMapper.map(customerEntity,CustomerDTO.class);
        customerDTO.setName(customerEntity.getFullname());
        customerDTO.setStatus(customerEntity.getStatus());
        return customerDTO;
    }


    public CustomerEntity ConverterCUstomerDTO(CustomerDTO customerDTO){
        CustomerEntity customerEntity = modelMapper.map(customerDTO,CustomerEntity.class);
        if(customerDTO.getId() != null){
            CustomerEntity x = customerRepository.findById(customerDTO.getId()).get();
            customerEntity.setCreatedBy(x.getCreatedBy());
            customerEntity.setCreatedDate(x.getCreatedDate());
            customerEntity.setUsers(x.getUsers());
        }
        customerEntity.setFullname(customerDTO.getName());
        customerEntity.setIsactive(1);
        return customerEntity;
    }

    /*public String Status (String s){
        Map<String,String> listStatus = StatusType.statusType();
        for (Map.Entry<String,String > entry : listStatus.entrySet()) {
            String value = entry.getValue();
            if(value.equalsIgnoreCase(s)){
                return entry.getKey();
            }
        }
        return null;

    }*/
}
