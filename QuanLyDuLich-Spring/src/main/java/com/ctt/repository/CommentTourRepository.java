/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository;

import com.ctt.pojos.CommentTour;

/**
 *
 * @author ADMIN
 */
public interface CommentTourRepository {
    CommentTour addCommentTour(CommentTour c);
    CommentTour getCommentById(int id);
    void removeCommentTour(CommentTour c);
}
