package com.javaweb.api.admin;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.ICustomerService;
import com.javaweb.service.ITransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@RestController( value = "customerAPIOfAdmin")
@RequestMapping("/admin/customer")
public class CustomerAPI {
    @Autowired
    private ICustomerService customerService;

    @Autowired
    private ITransactionService transactionService;

    @PostMapping
    public CustomerDTO creatCustomer(@RequestBody CustomerDTO newCustomer) {
        customerService.AddOrUpdateCustomer(newCustomer);
        return newCustomer;
    }

    @DeleteMapping("/{ids}")
    public void DeleteBuiling(@PathVariable List<Long> ids ){
       customerService.DeleteCustomer(ids);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs (@PathVariable Long id ){
        ResponseDTO a = customerService.listStaffs(id);
        return a;
    }

    @PostMapping("/assignment")
    public AssignmentCustomerDTO updateAssignmentBuilding (@RequestBody AssignmentCustomerDTO assignmentCustomerDTO){
        customerService.UpdateAssignmentCustomer(assignmentCustomerDTO);
        return assignmentCustomerDTO;
    }

    @PostMapping("/transaction")
    public void AddOrUpdateTransaction (@RequestBody TransactionDTO transactionDTO){
            transactionService.AddTransaction(transactionDTO);
    }



}
