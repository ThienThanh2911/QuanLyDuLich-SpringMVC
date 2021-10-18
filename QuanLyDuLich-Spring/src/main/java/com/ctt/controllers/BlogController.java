/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers;

import com.ctt.service.BlogService;
import com.ctt.service.CommentBlogService;
import com.ctt.service.RateBlogService;
import com.ctt.service.UserService;
import java.security.Principal;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ADMIN
 */
@Controller
public class BlogController {
    @Autowired
    private BlogService blogService;
    @Autowired
    private CommentBlogService commentBlogService;
    @Autowired
    private UserService userDetailsService;
    @Autowired
    private RateBlogService rateBlogService;
    
    @RequestMapping("/blog")
    public String blog(Model model, @RequestParam(required = false) Map<String, String> params) {
        model.addAttribute("blogs", this.blogService.getBlogs(params.get("kw"), Integer.parseInt(params.getOrDefault("page", "1")), true));
        return "blogLayout";
    }
    
    @RequestMapping("/blog-details/{blogId}")
    public String blogDetails(Model model, @PathVariable("blogId") String blogId, Principal principal) {
        if(principal != null){
            model.addAttribute("rate", this.rateBlogService.getRateBlog(this.userDetailsService.getUsers(principal.getName(), 1).get(0).getId(), Integer.parseInt(blogId)));
            model.addAttribute("user", this.userDetailsService.getUsers(principal.getName(), 1).get(0));
        }
        model.addAttribute("blog", this.blogService.getBlogById(Integer.parseInt(blogId)));
        model.addAttribute("comments", this.commentBlogService.getListCommentsBlogById(Integer.parseInt(blogId)));
        return "blogDetailsLayout";
    }
}
