package com.carcenter.service;

import com.carcenter.model.Message;

import java.util.List;

/**
 * Created by joy12 on 2017/12/13.
 */
public interface MessageService {
    List<Message> getMsgByFromId(Integer fromId);
    List<Message> getMsgByToId(Integer toId);
    boolean sendMsg(int fromId, int toId, String content);
    void setReadStatus(int[] msgIds,int status);

    List<Message> getAllMsg();
}
