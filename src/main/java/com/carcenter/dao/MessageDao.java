package com.carcenter.dao;

import com.carcenter.model.Message;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * Created by joy12 on 2017/12/3.
 */
public interface MessageDao {
    List<Message> getAllMessages();
}
