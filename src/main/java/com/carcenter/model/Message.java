package com.carcenter.model;

import java.sql.Timestamp;

/**
 * Created by joy12 on 2017/12/3.
 */
public class Message {
    private Integer id;
    private Integer fromId;
    private Integer toId;
    private String content;
    private Timestamp createTime;
    private Integer isRead;

    private Customer from;
    private Customer to;

    public Customer getFrom() {
        return from;
    }

    public void setFrom(Customer from) {
        this.from = from;
    }

    public Customer getTo() {
        return to;
    }

    public void setTo(Customer to) {
        this.to = to;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFromId() {
        return fromId;
    }

    public void setFromId(Integer fromId) {
        this.fromId = fromId;
    }

    public Integer getToId() {
        return toId;
    }

    public void setToId(Integer toId) {
        this.toId = toId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Integer getIsRead() {
        return isRead;
    }

    public void setIsRead(Integer isRead) {
        this.isRead = isRead;
    }
}
