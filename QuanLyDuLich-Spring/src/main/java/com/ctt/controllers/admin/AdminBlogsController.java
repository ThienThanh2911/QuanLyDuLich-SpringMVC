/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers.admin;

import com.ctt.pojos.Blog;
import com.ctt.pojos.User;
import com.ctt.service.BlogService;
import com.ctt.service.UserService;
import java.security.Principal;
import java.text.ParseException;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ADMIN
 */
@Controller
public class AdminBlogsController {
    @Autowired
    private BlogService blogService;
    @Autowired
    private UserService userDetailsService;
    
    @GetMapping("/admin/blogs")
    public String adminBlogsView(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException{
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("blogs", this.blogService.getBlogs(params.getOrDefault("titlename", null), page, false));
        model.addAttribute("countBlogs", (int)Math.ceil((double)this.blogService.countBlogs()/9));        
        return "adminBlogsLayout";
    }
    @GetMapping("/admin/blogs/{blogId}/edit")
    public String adminBlogView(Model model, @PathVariable("blogId") String blogId) throws ParseException{
        model.addAttribute("blog", this.blogService.getBlogById(Integer.parseInt(blogId)));
        return "adminEditBlogLayout";
    }
    @PostMapping("/admin/blogs/{blogId}/edit")
    public String adminBlogEdit(Model model, @ModelAttribute(value = "blog") Blog blog, @PathVariable("blogId") String blogId) throws ParseException{
        blog.setId(Integer.parseInt(blogId));
        this.blogService.addOrUpdateBlog(blog, null);
        return "adminEditBlogLayout";
    }
    @GetMapping("/admin/blogs/add")
    public String adminBlogView(Model model){
        model.addAttribute("blog", new Blog());
        return "adminAddBlogLayout";
    }
    @PostMapping("/admin/blogs/add")
    public String adminBlogEdit(Model model, @ModelAttribute(value = "blog") Blog blog, Principal principal){
        User user = this.userDetailsService.getUsers(principal.getName(), 1).get(0);
        if(this.blogService.addOrUpdateBlog(blog, user))
            return "redirect:/admin/blogs";
        return "adminAddBlogLayout";
    }
}
