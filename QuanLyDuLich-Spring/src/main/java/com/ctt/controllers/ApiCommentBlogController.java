/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers;

import com.ctt.pojos.CommentBlog;
import com.ctt.service.CommentBlogService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ADMIN
 */
@RestController
public class ApiCommentBlogController {
    @Autowired
    private CommentBlogService commentBlogService;
    
    @PostMapping(path = "/api/add-comment-blog", produces={
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<CommentBlog> addCommentBlog(@RequestBody Map<String, String> params){
        CommentBlog c = this.commentBlogService.addCommentBlog(params.get("content"), Integer.parseInt(params.get("userId")), Integer.parseInt(params.get("blogId")));
        if(c == null)
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        return new ResponseEntity<>(c, HttpStatus.CREATED);
    }

    @DeleteMapping(path = "/api/remove-comment-blog/{commentId}")
    public void removeCommentBlog(@PathVariable("commentId") String commentId){
        this.commentBlogService.removeCommentBlog(this.commentBlogService.getCommentBlogById(Integer.parseInt(commentId)));
    }
}
