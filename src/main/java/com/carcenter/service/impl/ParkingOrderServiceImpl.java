package com.carcenter.service.impl;


import com.carcenter.dao.ParkingOrderDao;
import com.carcenter.model.ParkingOrder;
import com.carcenter.service.ParkingOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by sts on 2017/12/18.
 */
@Service
public class ParkingOrderServiceImpl implements ParkingOrderService {
    @Autowired
    ParkingOrderDao parkingOrderDao;


    public List<ParkingOrder> getAllParkingOrder() {
        return parkingOrderDao.getAllParkingOrder();
    }



    public List<ParkingOrder> getStartParkingOrder() {
        return parkingOrderDao.startParkingOrder();
    }

    public List<ParkingOrder> getEndParkingOrder() {
        return parkingOrderDao.endParkingOrder();
    }


}
