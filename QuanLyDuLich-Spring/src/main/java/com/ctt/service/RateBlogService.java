/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service;

import com.ctt.pojos.RateBlog;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface RateBlogService {
    void setRateBlog(int rate, int userId, int blogId);
    int getRateBlog(int userId, int blogId);
    List<RateBlog> getListRateBlog(int blogId);
}
