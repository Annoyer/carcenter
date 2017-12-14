package com.carcenter.service.impl;

import com.carcenter.dao.MessageDao;
import com.carcenter.model.Message;
import com.carcenter.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by joy12 on 2017/12/13.
 */
@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageDao messageDao;

    public List<Message> getMsgByFromId(Integer fromId) {
        return messageDao.selectMessageByFromId(fromId);
    }

    public List<Message> getMsgByToId(Integer toId) {
        return messageDao.selectMessageByToId(toId);
    }

    public boolean sendMsg(int fromId, int toId, String content) {
        Message message = new Message();
        message.setContent(content);
        message.setFromId(fromId);
        message.setToId(toId);
        message.setIsRead(0);
        message.setCreateTime(new Timestamp(System.currentTimeMillis()));
        return messageDao.save(message) > 0;
    }

    public void setReadStatus(int[] msgIds,int status) {
        for (int msgId : msgIds) {
            messageDao.setIsRead(msgId,status);
        }
    }
}
