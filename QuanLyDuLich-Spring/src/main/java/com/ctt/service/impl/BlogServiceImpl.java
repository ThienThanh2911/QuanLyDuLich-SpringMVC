/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ctt.pojos.Blog;
import com.ctt.pojos.User;
import com.ctt.repository.BlogRepository;
import com.ctt.service.BlogService;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ADMIN
 */
@Service
public class BlogServiceImpl implements BlogService {
    @Autowired
    private BlogRepository blogRepository;
    @Autowired
    private Cloudinary cloudinary;
    
    @Override
    public List<Blog> getBlogs(String kw, int page, boolean isActive) {
        return this.blogRepository.getBlogs(kw, page, isActive);
    }
    
    @Override
    public List<Blog> getBlogsNew() {
        return this.blogRepository.getBlogsNew();
    }
    
    @Override
    public Blog getBlogById(int id) {
        return this.blogRepository.getBlogById(id);
    }

    @Override
    public boolean addOrUpdateBlog(Blog blog, User user) {
        boolean a = blog.isActive();
        MultipartFile img = blog.getFile();
        if(!this.blogRepository.getBlogs(blog.getTitle(), 1, false).isEmpty()){
            Blog rootBlog = this.blogRepository.getBlogs(blog.getTitle(), 1, false).get(0);
            blog.setId(rootBlog.getId());
            blog.setUser(rootBlog.getUser());
            blog.setCreatedDate(rootBlog.getCreatedDate());
        }else{
            a = true;
            if(this.blogRepository.getBlogById(blog.getId()) != null){
                blog.setUser(this.blogRepository.getBlogById(blog.getId()).getUser());
                blog.setCreatedDate(this.blogRepository.getBlogById(blog.getId()).getCreatedDate());
            }else{
                blog.setUser(user);
                blog.setCreatedDate(new Date());
            }
        }
        try {
            if (img != null && !img.isEmpty()) {
                Map r = this.cloudinary.uploader().upload(blog.getFile().getBytes(), 
                    ObjectUtils.asMap("resource_type", "auto"));
                blog.setPhotos((String) r.get("secure_url"));
            }
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
        blog.setActive(a);
        if(this.blogRepository.addOrUpdateBlog(blog))
            return true;
        return false;
    }

    @Override
    public void removeBlog(Blog blog) {
        this.blogRepository.removeBlog(blog);
    }

    @Override
    public long countBlogs() {
        return this.blogRepository.countBlogs();
    }
    
    
}
