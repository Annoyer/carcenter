package com.carcenter.dao;

import com.carcenter.model.ParkingOrder;
import org.apache.ibatis.annotations.Param;

/**
 * Created by joy12 on 2017/12/3.
 */
public interface ParkingOrderDao {
    int save(ParkingOrder parkingOrder);
    int updateStatus(@Param("orderId") int orderId,@Param("status") int status);
}
