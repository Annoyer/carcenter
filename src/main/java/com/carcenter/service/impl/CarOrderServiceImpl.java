package com.carcenter.service.impl;

import com.carcenter.dao.CarCommentDao;
import com.carcenter.dao.CarDao;
import com.carcenter.dao.CarOrderDao;
import com.carcenter.model.Car;
import com.carcenter.model.CarComment;
import com.carcenter.model.CarOrder;
import com.carcenter.model.ParkingOrder;
import com.carcenter.service.CarOrderService;
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
 * Created by joy12 on 2017/12/8.
 */
@Service
public class CarOrderServiceImpl implements CarOrderService {
    @Autowired
    CarOrderDao carOrderDao;
    @Autowired
    CarDao carDao;
    @Autowired
    CarCommentDao carCommentDao;

    public int makeOrder(Map<String, String[]> attrs) {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        String way = attrs.get("rentway")[0];
        Integer carId = Integer.parseInt(attrs.get("carId")[0]);
        CarOrder order = new CarOrder();
        order.setCarId(carId);
        order.setHirerId(Integer.parseInt(attrs.get("hirerId")[0]));
        order.setPrice(Double.parseDouble(attrs.get("price")[0]));
        order.setStatus(2);//等待车主接单
        Date start = null,end = null;
        Integer len = 0;
        try {
            if (way.equals("day")){
                start = sdf.parse(attrs.get("dayStart")[0]);
                len = Integer.parseInt(attrs.get("dayLen")[0]);
                order.setRentingPeriodDay(len);
                order.setRentingPeriodMonth(0);
                order.setRentingPeriodWeek(0);
            } else if (way.equals("week")){
                start = sdf.parse(attrs.get("weekStart")[0]);
                len = Integer.parseInt(attrs.get("weekLen")[0]);
                order.setRentingPeriodWeek(len);
                order.setRentingPeriodDay(0);
                order.setRentingPeriodMonth(0);
            } else if (way.equals("month")){
                start = sdf.parse(attrs.get("monthStart")[0]);
                len = Integer.parseInt(attrs.get("monthLen")[0]);
                order.setRentingPeriodMonth(len);
                order.setRentingPeriodDay(0);
                order.setRentingPeriodWeek(0);
            }
            end = getEndDay(start,len,way);
            order.setStartDay(start);
            order.setEndDay(end);
        } catch (ParseException e) {
            e.printStackTrace();
            return -1;
        }

        order.setCreateTime(new Timestamp(System.currentTimeMillis()));
        if (!checkIfAvailable(carId,start,end)){
            return 1;
        }
        carOrderDao.save(order);
        carDao.updateStatusById(carId,2);
        return 0;
    }

    public boolean dealOrderByCarOwner(int orderId, boolean isAccpet) {
        if (isAccpet){
            return carOrderDao.updateStatus(orderId,0) > 0;
        } else {
            return carOrderDao.updateStatus(orderId,-3) > 0;
        }
    }

    //改成：-1 已取消
    public boolean cancelOrderByCustomer(int orderId) {
        boolean result = carOrderDao.updateStatus(orderId,-1) > 0;
        if (result){
            Car car = carOrderDao.selectCarByOrderId(orderId);
            correctStatus(car.getId());
        }
        return result;
    }

    public boolean makeComment(CarComment comment) {
        comment.setCreateTime(new Timestamp(System.currentTimeMillis()));
        if (carCommentDao.insert(comment) > 0){
            carOrderDao.updateStatus(comment.getCarOrderId(),4);//订单状态为已评价
            return true;
        } else return false;
    }

    public boolean startOrderByAdmin(int orderId) {
        //订单状态变为正在进行
        boolean result = carOrderDao.updateStatus(orderId,1) > 0;
        if (result){
            //车辆状态变为已租
            carDao.updateStatusById(carOrderDao.selectCarByOrderId(orderId).getId(),1);
        }

        return result;
    }

    public boolean endOrderByAdmin(int orderId) {
        //订单状态变为历史订单
        boolean result = carOrderDao.updateStatus(orderId,3) > 0;
        if (result){
            Car car = carOrderDao.selectCarByOrderId(orderId);
            correctStatus(car.getId());
        }

        return result;
    }

    private Date getEndDay(Date start,Integer diff,String way){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(start);
        if (way.equals("day")){
            calendar.add(Calendar.DATE,diff);
        } else if (way.equals("week")){
            calendar.add(Calendar.DATE,diff*7);
        } else if (way.equals("month")){
            calendar.add(Calendar.MONTH,diff);
        }
        return calendar.getTime();
    }

    private boolean checkIfAvailable(Integer carId,Date start,Date end){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        List<CarOrder> result = carOrderDao.selectCarOrderByCarIdAndTime(carId,sdf.format(start),sdf.format(end));
        if (result!=null && result.size()>0){
            return false;
        } else {
            return true;
        }
    }

    private void correctStatus(int carId){
        List<CarOrder> orders = carOrderDao.selectAccessiableCarOrderByCarId(carId);
        if (orders==null || orders.size()==0){
            carDao.updateStatusById(carId,0);
        } else {
            carDao.updateStatusById(carId,2);
        }
    }


    public List<CarOrder> getAllCarOrder() {
        return carOrderDao.getAllCarOrder();
    }

    public List<CarOrder> startCarOrder() {
        return carOrderDao.startCarOrder();
    }

    public List<CarOrder> endCarOrder() {
        return carOrderDao.endCarOrder();
    }


}
