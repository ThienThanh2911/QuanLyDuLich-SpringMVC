/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.pojos;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "feedback")
public class FeedBack extends CommentTour{
    @ManyToOne
    @JoinColumn(name = "comment_id", nullable = true)
    private CommentTour commenttour;

    /**
     * @return the commenttour
     */
    public CommentTour getCommenttour() {
        return commenttour;
    }

    /**
     * @param commenttour the commenttour to set
     */
    public void setCommenttour(CommentTour commenttour) {
        this.commenttour = commenttour;
    }
}
