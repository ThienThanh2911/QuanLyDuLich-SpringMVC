/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service.impl;

import com.ctt.pojos.CommentBlog;
import com.ctt.repository.BlogRepository;
import com.ctt.repository.CommentBlogRepository;
import com.ctt.repository.UserRepository;
import com.ctt.service.CommentBlogService;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class CommentBlogServiceImpl implements CommentBlogService {
    @Autowired
    private CommentBlogRepository commentBlogRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BlogRepository blogRepository;

    @Override
    public CommentBlog addCommentBlog(String content, int userId, int blogId) {
        CommentBlog c = new CommentBlog();
        c.setComment(content);
        c.setUser(this.userRepository.getUserById(userId));
        c.setBlog(this.blogRepository.getBlogById(blogId));
        c.setCreated_date(new Date());
        return this.commentBlogRepository.addCommentBlog(c);
    }

    @Override
    public CommentBlog getCommentBlogById(int id) {
        return this.commentBlogRepository.getCommentBlogById(id);
    }

    @Override
    public void removeCommentBlog(CommentBlog c) {
        this.commentBlogRepository.removeCommentBlog(c);
    }
    
}
