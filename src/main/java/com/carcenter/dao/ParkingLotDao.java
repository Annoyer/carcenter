package com.carcenter.dao;

import com.carcenter.model.ParkingLot;
import com.carcenter.model.ParkingPlace;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by joy12 on 2017/12/3.
 */
public interface ParkingLotDao {
    List<ParkingLot> selectAllParkingLot();
    List<ParkingPlace> selectAvailableParkingPlaceByLotAndTime(@Param("lotId") Integer lotId, @Param("start") String start, @Param("end") String end);
    ParkingLot selectParkingLotById(Integer id);
    List<ParkingLot> selectParkingLotByName(@Param("name") String name);
    List<ParkingLot> selectParkingLotByAttr(@Param("value") String value);
    int save( ParkingLot parkingLot);
    int delete(@Param("lotId") int lotId);

}
