package com.javaweb.service;

import com.javaweb.model.dto.CustomerDTO;

public interface IEmailService {
     void sendEmail (CustomerDTO customerDTO);
}
