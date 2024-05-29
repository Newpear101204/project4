package com.javaweb.service.impl;

import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.service.IEmailService;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailSenderService implements IEmailService {

    private final JavaMailSender javaMailSender;

    public EmailSenderService(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }

    @Override
    public void sendEmail(CustomerDTO customerDTO) {
        SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
        StringBuilder subject = new StringBuilder("Dear ");
        if(customerDTO.getName() != null){
            subject.append(customerDTO.getName());
        } else {
            subject.append("you");
        }
        simpleMailMessage.setFrom("newpear2004@gmail.com");
        simpleMailMessage.setTo(customerDTO.getEmail());
        simpleMailMessage.setSubject(subject.toString());
        simpleMailMessage.setText("Thank you for finding us. Our staff will contact you soon to take care of you.");

        this.javaMailSender.send(simpleMailMessage);

    }
}
