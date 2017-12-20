package com.carcenter.dao;

import com.carcenter.model.ParkingPlace;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by joy12 on 2017/12/3.
 */
public interface ParkingPlaceDao {
    int updateStatusById(@Param("id") Integer id,@Param("status") Integer status);

    List<ParkingPlace> selectAllParkingSpace();

    int insertPlaceList(List<ParkingPlace> list);
}
