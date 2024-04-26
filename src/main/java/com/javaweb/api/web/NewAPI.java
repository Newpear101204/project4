package com.javaweb.api.web;

import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController(value = "newAPIOfWeb")
public class NewAPI {
    @Autowired
    private ICustomerService customerService;
    @PostMapping(value = "web/customer/contact")
    public CustomerDTO add (@RequestBody CustomerDTO customerDTO){
        customerDTO.setStatus("CHUA_XU_LI");
        customerService.AddOrUpdateCustomer(customerDTO);
        return customerDTO;
    }
	
}
