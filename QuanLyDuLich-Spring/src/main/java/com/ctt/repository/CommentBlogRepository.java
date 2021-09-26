/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository;

import com.ctt.pojos.CommentBlog;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface CommentBlogRepository {
    CommentBlog addCommentBlog(CommentBlog c);
    CommentBlog getCommentBlogById(int id);
    List<CommentBlog> getListCommentsBlogById(int blogId);
    void removeCommentBlog(CommentBlog c);
}
