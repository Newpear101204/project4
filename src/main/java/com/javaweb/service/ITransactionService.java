package com.javaweb.service;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;

import java.util.List;

public interface ITransactionService {
    List<TransactionEntity> getTransaction (CustomerEntity customerEntity, String code);
   // TransactionEntity getTransactionToUpdate (Long id);
    void AddTransaction (TransactionDTO transactionDTO);

}
