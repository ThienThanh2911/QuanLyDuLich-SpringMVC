/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository;

import com.ctt.pojos.CommentTour;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface CommentTourRepository {
    CommentTour addCommentTour(CommentTour c);
    CommentTour getCommentById(int id);
    List<CommentTour> getListCommentsTourById(int tourId);
    void removeCommentTour(CommentTour c);
    List<CommentTour> getCommentTours(int page, int tourId);
    long countCommentTours();
}
