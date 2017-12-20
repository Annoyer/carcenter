package com.carcenter.dao;

import com.carcenter.model.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by joy12 on 2017/12/3.
 */
public interface MessageDao {
    List<Message> selectMessageByFromId(@Param("fromId") int fromId);
    List<Message> selectMessageByToId(@Param("toId") int toId);
    int save(Message message);
    int setIsRead(@Param("id") int id,@Param("isRead") int isRead);

    List<Message> selectAllMessage();
}
