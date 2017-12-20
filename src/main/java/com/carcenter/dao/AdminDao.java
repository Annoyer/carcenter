package com.carcenter.dao;

import com.carcenter.model.Admin;
import org.apache.ibatis.annotations.Param;

/**
 * Created by joy12 on 2017/12/3.
 */
public interface AdminDao {
    Admin getAdminByNameAndPassword(@Param("name") String name,@Param("password")  String password);
}
