package com.carcenter.service.impl;

import com.carcenter.dao.AdminDao;
import com.carcenter.model.Admin;
import com.carcenter.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by joy12 on 2017/12/3.
 */
@Service
public class AdminServiceImpl implements AdminService{
    @Autowired
    AdminDao adminDao;

    public Admin adminLogin(String adminName,String password) {
        return adminDao.getAdminByNameAndPassword(adminName,password);
    }
}
