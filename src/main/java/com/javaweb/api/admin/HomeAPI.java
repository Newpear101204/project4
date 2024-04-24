package com.javaweb.api.admin;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController( value = "homeAPIOfAdmin")
public class HomeAPI {
    @Autowired
    private ICustomerService customerService;
    @PostMapping(value = "web/contact")
    public CustomerDTO add (@RequestBody CustomerDTO customerDTO){
        customerDTO.setStatus("CHUA");
        customerService.AddOrUpdateCustomer(customerDTO);
        return customerDTO;
    }
}
