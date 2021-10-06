/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers.admin;

import com.ctt.service.CommentBlogService;
import java.text.ParseException;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ADMIN
 */
@Controller
public class AdminCommentBlogsController {
    @Autowired
    private CommentBlogService commentBlogService;
    
    @GetMapping("/admin/commentblogs")
    public String adminCommentBlogsView(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException{
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("commentblogs", this.commentBlogService.getCommentBlogs(page));
        model.addAttribute("countPage", (int)Math.ceil((double)this.commentBlogService.countCommentBlogs()/9));        
        return "adminCommentBlogsLayout";
    }
}