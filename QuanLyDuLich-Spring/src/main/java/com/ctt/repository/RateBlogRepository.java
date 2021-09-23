/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository;

import com.ctt.pojos.RateBlog;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface RateBlogRepository {
    void setRateBlog(RateBlog r);
    int getRateBlog(int userId, int blogId);
    List<RateBlog> getListRateBlog(int blogId);
}
