package com.carcenter.dao;

import com.carcenter.model.News;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by joy12 on 2017/12/3.
 */
public interface NewsDao{
    int save(News news);
    List<News> getAllNews();
    List<News> getNewsByTitle(String title);
    int delete(@Param("newsId") int newsId);

    News selectNewsById(@Param("newsId") int newsId);
}
