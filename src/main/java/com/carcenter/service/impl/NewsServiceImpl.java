package com.carcenter.service.impl;

import com.carcenter.dao.NewsDao;
import com.carcenter.model.News;
import com.carcenter.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

/**
 * Created by sts on 2017/12/15.
 */
@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    NewsDao newsDao;



    public boolean release(News news) {
        news.setCreateTime(new Timestamp(System.currentTimeMillis()));
        return newsDao.save(news) > 0;
    }

    public List<News> getAllNews() {
        return newsDao.getAllNews();
    }

    public List<News> getNewsByTitle(String title) {
        return newsDao.getNewsByTitle(title);
    }

    public News getNewsById(int id) {
        return newsDao.selectNewsById(id);
    }

    public boolean deleteNews(int newsId) {
        return newsDao.delete(newsId) > 0;
    }

}
