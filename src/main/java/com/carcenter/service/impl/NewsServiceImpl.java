package com.carcenter.service.impl;

import com.carcenter.dao.NewsDao;
import com.carcenter.model.News;
import com.carcenter.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by sts on 2017/12/15.
 */
@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    NewsDao newsDao;



    public boolean release(News news) {
        boolean result = false;
        if (news.getTitle()!=null) {
            List<News> list = newsDao.getNewsByTitle(news.getTitle());
            if (list==null || list.size()==0)
            {
                newsDao.save(news);
                result = true;
            }
        }
        return result;
    }

    public List<News> getAllNews() {
        return newsDao.getAllNews();
    }

    public List<News> getNewsByTitle(String title) {
        return newsDao.getNewsByTitle(title);
    }

}
