package com.carcenter.dao;

import com.carcenter.model.Car;
import com.carcenter.model.CarOrder;
import com.carcenter.model.Customer;
import com.carcenter.model.ParkingOrder;

import java.util.List;

/**
 * Created by joy12 on 2017/12/3.
 */
public interface CustomerDao {

    int save(Customer customer);

    int update(Customer customer);

    List<Customer> selectCustomerByPhone(String phone);

    List<Customer> selectAllCustomers();

    Customer selectCustomerById(Integer id);

    List<Car> selectAvailableCarsByCustomer(Integer customerId);

    List<Car> selectUsingCarsByCustomer(Integer customerId);

    List<CarOrder> selectCarOrderByCustomer(Integer customerId);

    List<CarOrder> selectCarOrderByOwner(Integer customerId);

    List<ParkingOrder> selectParkingOrderByCustomer(Integer customerId);



}
