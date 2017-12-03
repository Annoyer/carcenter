package com.carcenter.model;

/**
 * Created by joy12 on 2017/12/3.
 */
public class Customer {

    private Integer id;
    private String name;
    private String password;
    private String phone;
    private String headimg;

    public Customer(){}

    public Customer(String name, String password, String phone, String headimg) {
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.headimg = headimg;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getHeadimg() {
        return headimg;
    }

    public void setHeadimg(String headimg) {
        this.headimg = headimg;
    }
}
