package com.carcenter.dao;

import org.apache.ibatis.annotations.Param;

/**
 * Created by joy12 on 2017/12/3.
 */
public interface ParkingPlaceDao {
    int updateStatusById(@Param("id") Integer id,@Param("status") Integer status);
}
