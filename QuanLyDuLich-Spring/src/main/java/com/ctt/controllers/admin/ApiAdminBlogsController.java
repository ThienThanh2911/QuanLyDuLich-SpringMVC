/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers.admin;

/**
 *
 * @author ADMIN
 */


import com.ctt.pojos.Blog;
import com.ctt.service.BlogService;
import org.springframework.stereotype.Controller;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.Map;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
@Controller
public class ApiAdminBlogsController {
    @Autowired
    private BlogService blogService;
    
    @PostMapping(path = "/admin/api/blogs/set-active-blog", produces={
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Blog> setActiveBlog(@RequestBody Map<String, String> params){
        Blog c = this.blogService.getBlogById(Integer.parseInt(params.get("blogId")));
        c.setActive(!c.isActive());
        if(!this.blogService.addOrUpdateBlog(c))
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    
    @DeleteMapping(path = "/admin/api/blogs/remove-blog/{blogId}")
    public void removeBlog(@PathVariable("blogId") String blogId){
        this.blogService.removeBlog(this.blogService.getBlogById(Integer.parseInt(blogId)));
    }
}
