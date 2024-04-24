package com.javaweb.service.impl;

import com.javaweb.converter.BuildingDTOConverter;
import com.javaweb.converter.CustomerDTOConverter;
import com.javaweb.converter.TransactionDTOConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional

public class CustomerService  implements ICustomerService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private CustomerDTOConverter customerDTOConverter;

    @Autowired
    private TransactionDTOConverter transactionDTOConverter;

    @Override
    public ResponseDTO listStaffs(Long customerId) {
        CustomerEntity customerEntity = customerRepository.findById(customerId).get();
        List<UserEntity> staffs  = userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<UserEntity> staffAssignment = customerEntity.getUsers();
        ResponseDTO a = customerDTOConverter.ConverterToResponseDTO(staffs,staffAssignment);
        return a;
    }

    @Override
    public List<CustomerDTO> listCustomer(CustomerSearchRequest customerSearchRequest) {
        List<CustomerEntity> customerEntityList = customerRepository.listCustomer(customerSearchRequest);
        List<CustomerDTO> customerDTOList = new ArrayList<>();
        for(CustomerEntity it : customerEntityList){
            CustomerDTO x = customerDTOConverter.ConverterCustomerEntity(it);
            customerDTOList.add(x);

        }
        return customerDTOList;
    }

    @Override
    public void AddOrUpdateCustomer(CustomerDTO customerDTO) {
        CustomerEntity x = customerDTOConverter.ConverterCUstomerDTO(customerDTO);
        customerRepository.save(x);
    }

    @Override
    public void DeleteCustomer(List<Long> ids) {
        for (Long it : ids){
            CustomerEntity x = customerRepository.findById(it).get();
            x.setIsactive(0);
            customerRepository.save(x);
        }
    }

    @Override
    public void UpdateAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO) {
        CustomerEntity customerEntity = customerRepository.findById(assignmentCustomerDTO.getCustomerId()).get();
        List<UserEntity> staffs = userRepository.findByIdIn(assignmentCustomerDTO.getStaffs());
        customerEntity.setUsers(staffs);
    }


}