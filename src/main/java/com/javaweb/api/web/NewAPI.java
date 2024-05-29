package com.javaweb.api.web;

import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.service.ICustomerService;
import com.javaweb.service.IEmailService;
import com.javaweb.service.impl.EmailSenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController(value = "newAPIOfWeb")
public class NewAPI {
    @Autowired
    private ICustomerService customerService;

    private final EmailSenderService email;


    public NewAPI(EmailSenderService email) {
        this.email = email;
    }

    @PostMapping(value = "web/customer/contact")
    public CustomerDTO add (@RequestBody CustomerDTO customerDTO){
        customerDTO.setStatus("CHUA_XU_LI");
        email.sendEmail(customerDTO);
        customerService.AddOrUpdateCustomer(customerDTO);
        return customerDTO;
    }
	
}
