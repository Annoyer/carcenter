package com.carcenter.service.impl;

import com.carcenter.dao.CarCommentDao;
import com.carcenter.dao.CarDao;
import com.carcenter.model.Car;
import com.carcenter.model.CarComment;
import com.carcenter.service.CarService;
import com.carcenter.util.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by joy12 on 2017/12/6.
 */
@Service
public class CarServiceImpl implements CarService{
    @Autowired
    CarDao carDao;
    @Autowired
    CarCommentDao carCommentDao;

    public List<Car> getAllCars() {
        return carDao.selectAllCars();
    }

    public List<Car> getCarsAvailableByTime(Date start, Date end) {
        if (start==null || end==null || start.after(end)) return null;

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        return carDao.selectCarsByAvailableTime(sdf.format(start),sdf.format(end));
    }

    public List<Car> getCarsByStatus(Integer status) {
        return carDao.selectCarsByStatus(status);
    }

    public List<Car> getCarsByAttributes(Map<String,String[]> attrs) {
        Map format = new HashMap();
        for (Map.Entry<String,String[]> e : attrs.entrySet()) {
            if (e.getKey().equals("years")){
                if (e.getValue()!=null && !e.getValue()[0].equals("不限")){
                    Integer min = Integer.parseInt(e.getValue()[0].split("-")[0]);
                    Integer max = Integer.parseInt(e.getValue()[0].split("-")[1]);
                    Integer now = Calendar.getInstance().get(Calendar.YEAR);

                    format.put("yearMin",now-max-1);
                    format.put("yearMax",now-min+1);
                }
            }else if (e.getKey().equals("price")){
                if (e.getValue()!=null && !e.getValue()[0].equals("不限")){
                    Integer min = Integer.parseInt(e.getValue()[0].split("-")[0]);
                    Integer max = Integer.parseInt(e.getValue()[0].split("-")[1]);

                    format.put("priceDayMin",min);
                    format.put("priceDayMax",max);
                }
            } else {
                if (e.getValue()!=null && !e.getValue()[0].equals("不限") && !e.getValue()[0].equals("")){
                    format.put(e.getKey(),e.getValue()[0]);
                }
            }

        }
        return carDao.selectCarsByAttributes(format);
    }

    public Car getCarById(Integer id) {
        return carDao.selectCarById(id);
    }

    public List<CarComment> getCarComments(Integer id) {
        return carCommentDao.selectCommentByCarId(id);
    }


    public boolean saveCar(Car car) {
        car.setCreateTime(new Timestamp(System.currentTimeMillis()));
        return carDao.save(car) > 0;
    }

    public String saveCarPic(MultipartFile file, HttpServletRequest request) {
        try {
            return FileUpload.uploadFile(file,request);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public boolean deleteCar(Integer id) {
        return carDao.delete(id) > 0;
    }

    public boolean checkCar(int id) {
        return carDao.updateStatusById(id,0) > 0;
    }

    public boolean modifyCar(Car car) {
        if(carDao.selectCarById(car.getId()).getStatus()!=0)
            return false;
        return carDao.update(car) > 0;
    }


    public List<Car> getCarsNeedCheck() {    return carDao.getCarsNeedCheck();}


}
