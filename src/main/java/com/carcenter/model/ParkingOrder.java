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
    private Double price;
    private Integer rentingPeriodMonth;
    private Integer rentingPeriodDay;
    private Date startDay;
    private Date endDay;
    private Integer status;////-3管理员拒绝订单 -2申请取消待审核 -1已取消 0待进行 1正在进行 2待管理员确认 3历史订单
    private Timestamp createTime;

    private ParkingPlace parkingPlace;

    public ParkingPlace getParkingPlace() {
        return parkingPlace;
    }

    public void setParkingPlace(ParkingPlace parkingPlace) {
        this.parkingPlace = parkingPlace;
    }

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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
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

    public Date getEndDay() {
        return endDay;
    }

    public void setEndDay(Date endDay) {
        this.endDay = endDay;
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
