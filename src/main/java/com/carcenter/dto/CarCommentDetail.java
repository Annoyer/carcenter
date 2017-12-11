package com.carcenter.dto;


import com.carcenter.model.Car;
import com.carcenter.model.CarComment;
import com.carcenter.model.Customer;

/**
 * Created by joy12 on 2017/12/8.
 */
public class CarCommentDetail {
    private CarComment carComment;
    private Car car;
    private Customer customer;

    public CarComment getCarComment() {
        return carComment;
    }

    public void setCarComment(CarComment carComment) {
        this.carComment = carComment;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }
}
