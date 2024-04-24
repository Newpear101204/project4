package com.javaweb.converter;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.CustomerRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TransactionDTOConverter {
    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private CustomerRepository customerRepository;

    public TransactionEntity TransactionDTOconverter(TransactionDTO transactionDTO){
        TransactionEntity transactionEntity = modelMapper.map(transactionDTO,TransactionEntity.class);
        transactionEntity.setNote(transactionDTO.getTransactionDetail());
        transactionEntity.setCustomers(customerRepository.findById(transactionDTO.getCustomerId()).get());
        return transactionEntity;

    }
}
