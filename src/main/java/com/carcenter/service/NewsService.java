package com.carcenter.service;

import com.carcenter.model.News;

import java.util.List;

/**
 * Created by sts on 2017/12/15.
 */
public interface NewsService {
    boolean release(News news);
    List<News> getAllNews();
    List<News> getNewsByTitle(String title);
}
