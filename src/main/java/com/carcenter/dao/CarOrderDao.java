package com.carcenter.dao;

import com.carcenter.model.Car;
import com.carcenter.model.CarOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by joy12 on 2017/12/3.
 */
public interface CarOrderDao {
    int save(CarOrder carOrder);

    int updateStatus(@Param("orderId") int orderId, @Param("status") int status);

    List<CarOrder> selectCarOrderByCarIdAndTime(@Param("carId")Integer carId,@Param("start") String start, @Param("end")String end);

    Car selectCarByOrderId(@Param("orderId") Integer orderId);

    List<CarOrder> selectAccessiableCarOrderByCarId(@Param("carId") int carId);

    List<CarOrder> getAllCarOrder();

    List<CarOrder> startCarOrder();

    List<CarOrder> endCarOrder();

}
