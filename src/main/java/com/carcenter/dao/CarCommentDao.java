package com.carcenter.dao;

import com.carcenter.model.CarComment;

import java.util.List;

/**
 * Created by joy12 on 2017/12/4.
 */
public interface CarCommentDao {
    List<CarComment> selectCommentByCarId(Integer id);
    int insert(CarComment carComment);
}
