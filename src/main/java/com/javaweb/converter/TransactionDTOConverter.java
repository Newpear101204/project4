package com.javaweb.converter;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TransactionDTOConverter {
    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private TransactionRepository transactionRepository;

    public TransactionEntity TransactionDTOconverter(TransactionDTO transactionDTO){
        TransactionEntity transactionEntity = modelMapper.map(transactionDTO,TransactionEntity.class);
        if(transactionDTO.getId() != null) {
            TransactionEntity x = transactionRepository.findById(transactionDTO.getId()).get();
            transactionEntity.setCreatedBy(x.getCreatedBy());
            transactionEntity.setCreatedDate(x.getCreatedDate());
        }
        transactionEntity.setNote(transactionDTO.getTransactionDetail());
        transactionEntity.setCustomers(customerRepository.findById(transactionDTO.getCustomerId()).get());
        return transactionEntity;

    }
}
