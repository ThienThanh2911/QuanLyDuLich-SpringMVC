/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository;

import com.ctt.pojos.Blog;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface BlogRepository {
    boolean addOrUpdateBlog(Blog blog);
    List<Blog> getBlogs(String kw, int page);
    List<Blog> getBlogsNew();
    Blog getBlogById(int id);
    void removeBlog(Blog blog);
    long countBlogs();
}
