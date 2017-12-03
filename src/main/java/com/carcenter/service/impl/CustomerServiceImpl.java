package com.carcenter.service.impl;

import com.carcenter.dao.CustomerDao;
import com.carcenter.model.Customer;
import com.carcenter.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by joy12 on 2017/12/3.
 */
@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    CustomerDao customerDao;

    public List<Customer> getAllCustomers() {
        return customerDao.getAllCustomers();
    }

    public Customer getCustomerById(Integer id) {
        return customerDao.getCustomerById(id);
    }
}
