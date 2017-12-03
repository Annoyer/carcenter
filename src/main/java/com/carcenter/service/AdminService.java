package com.carcenter.service;

import com.carcenter.model.Admin;

/**
 * Created by joy12 on 2017/12/3.
 */
public interface AdminService {
    Admin adminLogin(String adminName,String password);
}
