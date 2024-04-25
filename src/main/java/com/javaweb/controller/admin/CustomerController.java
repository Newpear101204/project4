package com.javaweb.controller.admin;

import com.javaweb.converter.CustomerDTOConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.enums.StatusType;
import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.ICustomerService;
import com.javaweb.service.IUserService;
import com.javaweb.service.impl.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController(value="customerControllerOfAdmin")

public class CustomerController {
    @Autowired
    private IUserService userService;

    @Autowired
    private ICustomerService customerService;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private CustomerDTOConverter customerDTOConverter;

    @Autowired
    private TransactionService transactionService;

    @RequestMapping(value = "/admin/customer-list", method = RequestMethod.GET)
    public ModelAndView customerlist (@ModelAttribute CustomerSearchRequest customerSearchRequest, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/list");
        mav.addObject("modelCustomer", customerSearchRequest);
        // xuong DB lay len
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            customerSearchRequest.setStaffId(SecurityUtils.getPrincipal().getId());
        }
        List<CustomerSearchResponse> customerList = customerService.listCustomer(customerSearchRequest);
        CustomerSearchResponse a = new CustomerSearchResponse();
        a.setListResult(customerList);
        a.setTotalItems(customerList.size());
        mav.addObject("customerList",a);
        mav.addObject("ListStaffs",userService.getStaffs());
        return mav;
    }

    @RequestMapping(value = "/admin/customer-edit", method = RequestMethod.GET)
    public ModelAndView customerADD  (@ModelAttribute CustomerDTO customerDTO, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("customerEdit",customerDTO);
        mav.addObject("statusType", StatusType.statusType());
        return mav;
    }

    @RequestMapping(value = "/admin/customer-edit-{id}", method = RequestMethod.GET)
    public ModelAndView customerEdit  (@PathVariable Long id , HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        CustomerEntity x = customerRepository.findById(id).get();
        CustomerDTO customerDTO = customerDTOConverter.ConverterCustomerEntityToDTO(x);
        mav.addObject("customerEdit",customerDTO);
        mav.addObject("transactionType", TransactionType.transactionType());
        mav.addObject("statusType", StatusType.statusType());
        List<TransactionEntity> cskh = transactionService.getTransaction(x,"CSKH");
        List<TransactionEntity> ddx  = transactionService.getTransaction(x,"DDX");
        mav.addObject("cskh",cskh);
        mav.addObject("ddx",ddx);
        return mav;
    }

}
