package com.carcenter.service.impl;

import com.carcenter.dao.MessageDao;
import com.carcenter.model.Message;
import com.carcenter.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by sts on 2017/12/15.
 */
@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    MessageDao messageDao;


    public List<Message> selectAllMessage() {
        return messageDao.getAllMessages();
    }
}
