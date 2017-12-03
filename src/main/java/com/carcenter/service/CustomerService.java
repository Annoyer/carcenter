package com.carcenter.service;

import com.carcenter.model.Customer;

import java.util.List;

/**
 * Created by joy12 on 2017/12/3.
 */
public interface CustomerService {

    List<Customer> getAllCustomers();

    Customer getCustomerById(Integer id);
}
