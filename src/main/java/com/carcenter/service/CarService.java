package com.carcenter.service;

import com.carcenter.model.Car;
import com.carcenter.model.CarComment;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by joy12 on 2017/12/6.
 */
public interface CarService {
    List<Car> getAllCars();
    List<Car> getCarsAvailableByTime(Date start,Date end);
    List<Car> getCarsByStatus(Integer status);
    List<Car> getCarsByAttributes(Map<String,String[]> attrs);

    Car getCarById(Integer id);
    List<CarComment> getCarComments(Integer id);

    boolean saveCar(Car car);
    String saveCarPic(MultipartFile file, HttpServletRequest request);
    boolean deleteCar(Integer id);
    boolean modifyCar(Car car);
}
