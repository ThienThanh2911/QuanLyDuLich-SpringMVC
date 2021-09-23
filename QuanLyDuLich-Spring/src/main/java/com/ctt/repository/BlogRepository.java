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
    List<Blog> getBlogs(String kw);
    Blog getBlogById(int id);
}
