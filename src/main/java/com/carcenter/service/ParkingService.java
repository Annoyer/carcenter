package com.carcenter.service;

import com.carcenter.model.ParkingLot;
import com.carcenter.model.ParkingOrder;
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
    boolean cancelOrderByCustomer(int orderId);

    boolean startOrderByAdmin(int orderId);
    boolean endOrderByAdmin(int orderId);

    boolean deleteLot(int lotId);
    boolean release(ParkingLot parkingLot);
    List<ParkingLot> getParkingLotByAttr(String value);

}
