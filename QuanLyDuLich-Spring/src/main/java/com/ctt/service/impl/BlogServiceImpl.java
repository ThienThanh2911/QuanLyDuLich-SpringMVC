/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service.impl;

import com.ctt.pojos.Blog;
import com.ctt.repository.BlogRepository;
import com.ctt.service.BlogService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    private BlogRepository blogRepository;
    
    @Override
    public List<Blog> getBlogs(String kw) {
        return this.blogRepository.getBlogs(kw);
    }

    @Override
    public Blog getBlogById(int id) {
        return this.blogRepository.getBlogById(id);
    }
    
    
}
