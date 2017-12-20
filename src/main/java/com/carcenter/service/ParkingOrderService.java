package com.carcenter.service;

import com.carcenter.model.ParkingOrder;

import java.util.List;


/**
 * Created by sts on 2017/12/18.
 */
public interface ParkingOrderService {

    List<ParkingOrder> getAllParkingOrder();

    List<ParkingOrder> getStartParkingOrder();
    List<ParkingOrder> getEndParkingOrder();

}
