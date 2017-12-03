package com.carcenter.dao;

import com.carcenter.model.Customer;

import java.util.List;

/**
 * Created by joy12 on 2017/12/3.
 */
public interface CustomerDao {

    void save(Customer customer);

    List<Customer> getCustomerByPhone(String phone);

    List<Customer> getAllCustomers();

    Customer getCustomerById(Integer id);


}
