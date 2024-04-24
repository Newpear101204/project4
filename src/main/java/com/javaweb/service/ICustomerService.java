package com.javaweb.service;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface ICustomerService {

    ResponseDTO listStaffs (Long customerId);

    List<CustomerDTO> listCustomer (CustomerSearchRequest customerSearchRequest);

    void AddOrUpdateCustomer(CustomerDTO customerDTO);

    void DeleteCustomer(List<Long> ids);

    void UpdateAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO);

}
