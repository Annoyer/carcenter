package com.carcenter.dao;

import com.carcenter.model.Car;
import com.carcenter.model.CarComment;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by joy12 on 2017/12/3.
 */
public interface CarDao {
    List<Car> selectAllCars();
    List<Car> selectCarsByStatus(Integer status);
    List<Car> selectCarsByAvailableTime(String start,String end);//这个函数要多表查
    List<Car> selectCarsByAttributes(Map attrs);

    Car selectCarById(Integer id);


    int save(Car car);
    int delete(Integer id);
    int update(Car car);

    int updateStatusById(@Param("id") Integer id,@Param("status") Integer status);


    List<Car> getCarsNeedCheck();
}
