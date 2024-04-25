package com.javaweb.service.impl;

import com.javaweb.converter.TransactionDTOConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.ITransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class TransactionService implements ITransactionService {
    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private TransactionDTOConverter transactionDTOConverter;

    @Override
    public List<TransactionEntity> getTransaction(CustomerEntity customerEntity, String code) {
        List<TransactionEntity> list = transactionRepository.findByCustomersAndCode(customerEntity,code);
        return list;
    }

    @Override
    public void AddTransaction(TransactionDTO transactionDTO) {
        TransactionEntity transactionEntity = transactionDTOConverter.TransactionDTOconverter(transactionDTO);
        transactionRepository.save(transactionEntity);
    }


}
