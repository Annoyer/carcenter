package com.carcenter.service;

import com.carcenter.model.CarComment;

import java.util.Map;

/**
 * Created by joy12 on 2017/12/8.
 */
public interface CarOrderService {
    int makeOrder(Map<String,String[]> attrs);
    boolean dealOrderByCarOwner(int orderId,boolean isAccpet);
    boolean cancelOrderByCustomer(int orderId);
    boolean makeComment(CarComment comment);
}
