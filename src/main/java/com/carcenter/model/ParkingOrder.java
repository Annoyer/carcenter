package com.carcenter.model;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by joy12 on 2017/12/3.
 */
public class ParkingOrder {
    private Integer id;
    private Integer parkingPlaceId;
    private Integer hirerId;
    private Integer price;
    private Integer rentingPeriodMonth;
    private Integer rentingPeriodDay;
    private Date startDay;
    private Integer status;
    private Timestamp createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParkingPlaceId() {
        return parkingPlaceId;
    }

    public void setParkingPlaceId(Integer parkingPlaceId) {
        this.parkingPlaceId = parkingPlaceId;
    }

    public Integer getHirerId() {
        return hirerId;
    }

    public void setHirerId(Integer hirerId) {
        this.hirerId = hirerId;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getRentingPeriodMonth() {
        return rentingPeriodMonth;
    }

    public void setRentingPeriodMonth(Integer rentingPeriodMonth) {
        this.rentingPeriodMonth = rentingPeriodMonth;
    }

    public Integer getRentingPeriodDay() {
        return rentingPeriodDay;
    }

    public void setRentingPeriodDay(Integer rentingPeriodDay) {
        this.rentingPeriodDay = rentingPeriodDay;
    }

    public Date getStartDay() {
        return startDay;
    }

    public void setStartDay(Date startDay) {
        this.startDay = startDay;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
}
