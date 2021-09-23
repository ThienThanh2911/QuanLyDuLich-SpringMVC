/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers;

import com.ctt.pojos.CommentTour;
import com.ctt.service.CommentTourService;
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
public class ApiCommentTourController {
    @Autowired
    private CommentTourService commentTourService;
    
    @PostMapping(path = "/api/add-comment-tour", produces={
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<CommentTour> addCommentTour(@RequestBody Map<String, String> params){
        CommentTour c = this.commentTourService.addComment(params.get("content"), Integer.parseInt(params.get("userId")), Integer.parseInt(params.get("tourId")));
        if(c == null)
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        return new ResponseEntity<>(c, HttpStatus.CREATED);
    }

    @DeleteMapping(path = "/api/remove-comment-tour/{commentId}")
    public void removeCommentTour(@PathVariable("commentId") String commentId){
        this.commentTourService.removeCommentTour(this.commentTourService.getCommentById(Integer.parseInt(commentId)));
    }
}
