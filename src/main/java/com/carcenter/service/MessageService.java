package com.carcenter.service;

import com.carcenter.model.Message;

import java.util.List;

/**
 * Created by sts on 2017/12/15.
 */
public interface MessageService {
    List<Message> selectAllMessage();
}
