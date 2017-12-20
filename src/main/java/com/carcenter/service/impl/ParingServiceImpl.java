package com.carcenter.service.impl;

import com.carcenter.dao.ParkingLotDao;
import com.carcenter.dao.ParkingOrderDao;
import com.carcenter.dao.ParkingPlaceDao;
import com.carcenter.model.CarOrder;
import com.carcenter.model.ParkingLot;
import com.carcenter.model.ParkingOrder;
import com.carcenter.model.ParkingPlace;
import com.carcenter.service.ParkingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by joy12 on 2017/12/6.
 */
@Service
public class ParingServiceImpl implements ParkingService{
    @Autowired
    ParkingLotDao parkingLotDao;

    @Autowired
    ParkingPlaceDao parkingPlaceDao;

    @Autowired
    ParkingOrderDao parkingOrderDao;

    public List<ParkingLot> getAllParkingLot() {
        return parkingLotDao.selectAllParkingLot();
    }

    public ParkingLot getParkingLotById(Integer lotId) {
        return parkingLotDao.selectParkingLotById(lotId);
    }

    public List<ParkingPlace> getAvailableParkingPlaceByLotAndTime(Integer lotId, String start, Integer length,String way) {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        try {
            calendar.setTime(sdf.parse(start));
            if (way.equals("day")){
                calendar.add(Calendar.DATE,length);
            } else {
                calendar.add(Calendar.MONTH,length);
            }
            String end = sdf.format(calendar.getTime());
            return parkingLotDao.selectAvailableParkingPlaceByLotAndTime(lotId,start,end);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return null;
    }

    public int makeOrder(Map<String, String[]> attrs) {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        String way = attrs.get("rentway")[0];
        Integer parkingPlaceId = Integer.parseInt(attrs.get("parkingPlaceId")[0]);
        ParkingOrder order = new ParkingOrder();
        order.setParkingPlaceId(parkingPlaceId);
        order.setHirerId(Integer.parseInt(attrs.get("hirerId")[0]));
        order.setPrice(Double.parseDouble(attrs.get("price")[0]));
        order.setStatus(0);//待管理员确认
        Date start = null,end = null;
        Integer len = 0;
        try {
            if (way.equals("day")){
                start = sdf.parse(attrs.get("dayStart")[0]);
                len = Integer.parseInt(attrs.get("dayLen")[0]);
                order.setRentingPeriodDay(len);
                order.setRentingPeriodMonth(0);
            } else if (way.equals("week")){
                start = sdf.parse(attrs.get("weekStart")[0]);
                len = Integer.parseInt(attrs.get("weekLen")[0]);
                order.setRentingPeriodDay(0);
                order.setRentingPeriodMonth(0);
            } else if (way.equals("month")){
                start = sdf.parse(attrs.get("monthStart")[0]);
                len = Integer.parseInt(attrs.get("monthLen")[0]);
                order.setRentingPeriodMonth(len);
                order.setRentingPeriodDay(0);
            }
            end = getEndDay(start,len,way);
            order.setStartDay(start);
            order.setEndDay(end);
        } catch (ParseException e) {
            e.printStackTrace();
            return -1;
        }

        order.setCreateTime(new Timestamp(System.currentTimeMillis()));
//        if (!checkIfAvailable(parkingPlaceId,start,end)){
//            return 1;
//        }
        parkingOrderDao.save(order);
        parkingPlaceDao.updateStatusById(parkingPlaceId,2);
        return 0;
    }

    private Date getEndDay(Date start,Integer diff,String way){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(start);
        if (way.equals("day")){
            calendar.add(Calendar.DATE,diff);
        } else if (way.equals("month")){
            calendar.add(Calendar.MONTH,diff);
        }
        return calendar.getTime();
    }

    public boolean cancelOrderByCustomer(int orderId) {
        boolean result = parkingOrderDao.updateStatus(orderId,-1) > 0;
        if (result){
            ParkingOrder order = parkingOrderDao.selectParkingOrderById(orderId);
            correctStatus(order.getParkingPlaceId());
        }
        return result;
    }

    public boolean startOrderByAdmin(int orderId) {
        //订单状态变为正在进行
        boolean result = parkingOrderDao.updateStatus(orderId,1) > 0;
        if (result){
            //车位状态变为已租
            parkingPlaceDao.updateStatusById(parkingOrderDao.selectParkingOrderById(orderId).getParkingPlaceId(),1);
        }

        return result;
    }

    public boolean endOrderByAdmin(int orderId) {
        boolean result = parkingOrderDao.updateStatus(orderId,3) > 0;
        if (result){
            ParkingOrder order = parkingOrderDao.selectParkingOrderById(orderId);
            correctStatus(order.getParkingPlaceId());
        }
        return result;
    }

    private void correctStatus(int placeId){
        List<ParkingOrder> orders = parkingOrderDao.selectAccessiableParkingOrderByPlaceId(placeId);
        if (orders==null || orders.size()==0){
            parkingPlaceDao.updateStatusById(placeId,0);
        } else {
            parkingPlaceDao.updateStatusById(placeId,2);
        }
    }


    public List<ParkingPlace> getAllParkingSpace() {
        return parkingPlaceDao.selectAllParkingSpace();
    }

    public boolean release(ParkingLot parkingLot) {
        List<ParkingLot> existList = parkingLotDao.selectParkingLotByName(parkingLot.getName());
        if (existList != null && existList.size() > 0){
            return false;
        } else if (parkingLotDao.save(parkingLot)>0){
            ParkingLot lot = parkingLotDao.selectParkingLotByName(parkingLot.getName()).get(0);
            List<ParkingPlace> places = new ArrayList<ParkingPlace>();
            for (int i = 1; i <= lot.getVolumn(); i++) {
                ParkingPlace p = new ParkingPlace();
                p.setIdentifier(i);
                p.setParkingLotId(lot.getId());
                p.setStatus(0);
                places.add(p);
            }
            return parkingPlaceDao.insertPlaceList(places) > 0;
        }
        return false;
    }

    public List<ParkingLot> getParkingLotByAttr(String value) {
        return parkingLotDao.selectParkingLotByAttr(value);
    }

    public boolean deleteLot(int lotId) {return parkingLotDao.delete(lotId)>0;}
}
