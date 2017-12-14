package com.carcenter.service;

import com.carcenter.model.Car;
import com.carcenter.model.CarOrder;
import com.carcenter.model.Customer;
import com.carcenter.model.ParkingOrder;

import java.util.List;

/**
 * Created by joy12 on 2017/12/3.
 */
public interface CustomerService {

    boolean register(Customer customer);

    Customer login(String phone, String password);

    boolean modifyCustomerInfo(Customer customer);

    List<Customer> getAllCustomers();

    Customer getCustomerById(Integer id);

    List<Car> getAvailableCarsByCustomer(Integer customerId);

    List<Car> getUsingCarsByCustomer(Integer customerId);

    List<CarOrder> getCarOrdersByCustomer(Integer customerId);

    List<ParkingOrder> getParkingOrdersByCustomer(Integer customerId);

    List<CarOrder> getCarOrdersByOwner(Integer customerId);

}
