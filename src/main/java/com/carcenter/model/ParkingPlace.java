package com.carcenter.model;

/**
 * Created by joy12 on 2017/12/3.
 */
public class ParkingPlace {
    private Integer id;
    private Integer parkingLotId;
    private Integer identifier;
    private Double priceMonth;
    private Double priceDay;
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParkingLotId() {
        return parkingLotId;
    }

    public void setParkingLotId(Integer parkingLotId) {
        this.parkingLotId = parkingLotId;
    }

    public Integer getIdentifier() {
        return identifier;
    }

    public void setIdentifier(Integer identifier) {
        this.identifier = identifier;
    }

    public Double getPriceMonth() {
        return priceMonth;
    }

    public void setPriceMonth(Double priceMonth) {
        this.priceMonth = priceMonth;
    }

    public Double getPriceDay() {
        return priceDay;
    }

    public void setPriceDay(Double priceDay) {
        this.priceDay = priceDay;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
