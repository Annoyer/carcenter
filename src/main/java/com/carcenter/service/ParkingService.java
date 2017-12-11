package com.carcenter.service;

import com.carcenter.model.ParkingLot;
import com.carcenter.model.ParkingPlace;

import java.util.List;
import java.util.Map;

/**
 * Created by joy12 on 2017/12/6.
 */
public interface ParkingService {
    List<ParkingLot> getAllParkingLot();
    ParkingLot getParkingLotById(Integer lotId);
    List<ParkingPlace> getAvailableParkingPlaceByLotAndTime(Integer lotId, String start, Integer length, String way);
    int makeOrder(Map<String, String[]> attrs);
}
