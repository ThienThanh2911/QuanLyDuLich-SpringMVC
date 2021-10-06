/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.pojos;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "payments")
public class Payments implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "created_date")
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy HH:mm:ss")
    private Date createdDate;
    @NotNull(message = "{tour.price.nullError}")
    @Min(value = 100000, message = "{tour.price.minError}")
    @Max(value = 10000000, message = "{tour.price.maxError}")
    private BigDecimal price;
    private int adult;
    private int children;
    private String description;
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "tour_id")
    private Tours tour;
    private Methods method;
    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "date_id")
    private DateDetail datedetail;
    private String status;
    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the price
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the user
     */
    public User getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(User user) {
        this.user = user;
    }

    /**
     * @return the tour
     */
    public Tours getTour() {
        return tour;
    }

    /**
     * @param tour the tour to set
     */
    public void setTour(Tours tour) {
        this.tour = tour;
    }

    /**
     * @return the method
     */
    public Methods getMethod() {
        return method;
    }

    /**
     * @param method the method to set
     */
    public void setMethod(Methods method) {
        this.method = method;
    }

    /**
     * @return the created_date
     */
    public Date getCreatedDate() {
        return createdDate;
    }

    /**
     * @param createdDate
     */
    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    /**
     * @return the adult
     */
    public int getAdult() {
        return adult;
    }

    /**
     * @param adult the adult to set
     */
    public void setAdult(int adult) {
        this.adult = adult;
    }

    /**
     * @return the children
     */
    public int getChildren() {
        return children;
    }

    /**
     * @param children the children to set
     */
    public void setChildren(int children) {
        this.children = children;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the datedetail
     */
    public DateDetail getDatedetail() {
        return datedetail;
    }

    /**
     * @param datedetail the datedetail to set
     */
    public void setDatedetail(DateDetail datedetail) {
        this.datedetail = datedetail;
    }
}
