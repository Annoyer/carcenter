package com.carcenter.dao;

import com.carcenter.model.Admin;

/**
 * Created by joy12 on 2017/12/3.
 */
public interface AdminDao {
    Admin getAdminByNameAndPassword(String adminName,String password);
}
