/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service.impl;

import com.ctt.pojos.RateBlog;
import com.ctt.repository.BlogRepository;
import com.ctt.repository.RateBlogRepository;
import com.ctt.repository.UserRepository;
import com.ctt.service.RateBlogService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class RateBlogServiceImpl implements RateBlogService{
    @Autowired
    private RateBlogRepository rateBlogRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BlogRepository blogRepository;
    
    @Override
    public int getRateBlog(int userId, int blogId) {
        return this.rateBlogRepository.getRateBlog(userId, blogId);
    }

    @Override
    public void setRateBlog(int rate, int userId, int blogId) {
        RateBlog ra = null;
        for(RateBlog rb : this.rateBlogRepository.getListRateBlog(blogId)){
            if(rb.getUser().getId() == userId){
                ra = rb;
                break;
            }
        }
        if(ra == null){
            RateBlog r = new RateBlog();
            r.setRate(rate);
            r.setUser(this.userRepository.getUserById(userId));
            r.setBlog(this.blogRepository.getBlogById(blogId));
            this.rateBlogRepository.setRateBlog(r);
        }else{
            ra.setRate(rate);
            this.rateBlogRepository.setRateBlog(ra);
        }
        
    }

    @Override
    public List<RateBlog> getListRateBlog(int blogId) {
        return this.rateBlogRepository.getListRateBlog(blogId);
    }
    
    
}
