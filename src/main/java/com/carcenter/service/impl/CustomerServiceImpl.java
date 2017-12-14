package com.carcenter.service.impl;

import com.carcenter.dao.CustomerDao;
import com.carcenter.model.Car;
import com.carcenter.model.CarOrder;
import com.carcenter.model.Customer;
import com.carcenter.model.ParkingOrder;
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

    public boolean register(Customer customer) {
        boolean result = false;
        if (customer.getPhone()!=null){
            List<Customer> list = customerDao.selectCustomerByPhone(customer.getPhone());
            if (list==null || list.size()==0){
                customerDao.save(customer);
                result = true;
            }
        }
        return result;
    }

    public Customer login(String phone, String password) {
        List<Customer> list = customerDao.selectCustomerByPhone(phone);
        Customer customer = null;
        if (list!=null && list.size()>0){
            customer = list.get(0);
            if (!password.equals(customer.getPassword())){
                customer = null;
            }
        }
        return customer;
    }

    public boolean modifyCustomerInfo(Customer customer) {
        return customerDao.update(customer) > 0;
    }

    public List<Customer> getAllCustomers() {
        return customerDao.selectAllCustomers();
    }

    public Customer getCustomerById(Integer id) {
        return customerDao.selectCustomerById(id);
    }

    public List<Car> getAvailableCarsByCustomer(Integer customerId) {
        return customerDao.selectAvailableCarsByCustomer(customerId);
    }

    public List<Car> getUsingCarsByCustomer(Integer customerId) {
        return customerDao.selectUsingCarsByCustomer(customerId);
    }

    public List<CarOrder> getCarOrdersByCustomer(Integer customerId) {
        return customerDao.selectCarOrderByCustomer(customerId);
    }

    public List<ParkingOrder> getParkingOrdersByCustomer(Integer customerId) {
        return customerDao.selectParkingOrderByCustomer(customerId);
    }

    public List<CarOrder> getCarOrdersByOwner(Integer customerId) {
        return customerDao.selectCarOrderByOwner(customerId);
    }
}
