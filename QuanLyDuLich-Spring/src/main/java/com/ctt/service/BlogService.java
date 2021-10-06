/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service;

import com.ctt.pojos.Blog;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface BlogService {
    boolean addOrUpdateBlog(Blog blog);
    List<Blog> getBlogs(String kw, int page);
    Blog getBlogById(int id);
    void removeBlog(Blog blog);
    long countBlogs();
}
