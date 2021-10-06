/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service.impl;

import com.ctt.pojos.CommentTour;
import com.ctt.repository.CommentTourRepository;
import com.ctt.repository.TourRepository;
import com.ctt.repository.UserRepository;
import com.ctt.service.CommentTourService;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class CommentTourServiceImpl implements CommentTourService {
    @Autowired
    private CommentTourRepository commentTourRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private TourRepository tourRepository;

    @Override
    public CommentTour addComment(String content, int userId, int tourId) {
        CommentTour c = new CommentTour();
        c.setComment(content);
        c.setUser(this.userRepository.getUserById(userId));
        c.setTour(this.tourRepository.getTourById(tourId));
        c.setCreated_date(new Date());
        return this.commentTourRepository.addCommentTour(c);
    }

    @Override
    public CommentTour getCommentById(int id) {
        return this.commentTourRepository.getCommentById(id);
    }

    @Override
    public void removeCommentTour(CommentTour c) {
        this.commentTourRepository.removeCommentTour(c);
    }

    @Override
    public List<CommentTour> getListCommentsTourById(int tourId) {
        return this.commentTourRepository.getListCommentsTourById(tourId);
    }

    @Override
    public List<CommentTour> getCommentTours(int i) {
        return this.commentTourRepository.getCommentTours(i);
    }

    @Override
    public long countCommentTours() {
        return this.commentTourRepository.countCommentTours();
    }
    
    
    
}
