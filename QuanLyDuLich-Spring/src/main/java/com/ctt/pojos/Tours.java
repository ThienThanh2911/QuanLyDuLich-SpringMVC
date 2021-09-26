/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.pojos;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.Transient;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Windows-1909
 */
@Entity
@Table(name = "tours")
public class Tours implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Size(min = 5, max = 30, message = "{tour.name.lenError}")
    private String name;
    private String description;
    @NotNull(message = "{tour.destination.nullError}")
    private String destination;
    private Vehicle vehicle;
    private String photos;
    @NotNull(message = "{tour.price.nullError}")
    @Min(value = 100000, message = "{tour.price.minError}")
    @Max(value = 10000000, message = "{tour.price.maxError}")
    private BigDecimal price;
    private boolean active;
    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "category_id")
    //@NotNull(message = "{tour.category.nullError}")
    private Category category;
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
        name = "tour_tag",
        joinColumns = {
            @JoinColumn(name = "tour_id")
        },
        inverseJoinColumns = {
            @JoinColumn(name = "tag_id")
        }
    )
    private Set<Tags> tags;
    @Transient
    private MultipartFile file;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tour")
    private Set<Payments> payments;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tour")
    private Set<TourBooking> tourbooking;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "tour")
    private Set<DateDetail> datedetail;
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "tour")
    private Set<RateTour> ratetour;
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "tour")
    private Set<CommentTour> commenttour;

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
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
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
     * @return the destination
     */
    public String getDestination() {
        return destination;
    }

    /**
     * @param destination the destination to set
     */
    public void setDestination(String destination) {
        this.destination = destination;
    }

    /**
     * @return the photos
     */
    public String getPhotos() {
        return photos;
    }

    /**
     * @param photos the photos to set
     */
    public void setPhotos(String photos) {
        this.photos = photos;
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
     * @return the active
     */
    public boolean isActive() {
        return active;
    }

    /**
     * @param active the active to set
     */
    public void setActive(boolean active) {
        this.active = active;
    }

    /**
     * @return the category
     */
    public Category getCategory() {
        return category;
    }

    /**
     * @param category the category to set
     */
    public void setCategory(Category category) {
        this.category = category;
    }

    /**
     * @return the file
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }

    /**
     * @return the tags
     */
    public Set<Tags> getTags() {
        return tags;
    }

    /**
     * @param tags the tags to set
     */
    public void setTags(Set<Tags> tags) {
        this.tags = tags;
    }

    /**
     * @return the payments
     */
    public Set<Payments> getPayments() {
        return payments;
    }

    /**
     * @param payments the payments to set
     */
    public void setPayments(Set<Payments> payments) {
        this.payments = payments;
    }

    /**
     * @return the tourbooking
     */
    public Set<TourBooking> getTourbooking() {
        return tourbooking;
    }

    /**
     * @param tourbooking the tourbooking to set
     */
    public void setTourbooking(Set<TourBooking> tourbooking) {
        this.tourbooking = tourbooking;
    }

    /**
     * @return the commenttour
     */
    public Set<CommentTour> getCommenttour() {
        return commenttour;
    }

    /**
     * @param commenttour the commenttour to set
     */
    public void setCommenttour(Set<CommentTour> commenttour) {
        this.commenttour = commenttour;
    }

    /**
     * @return the vehicle
     */
    public Vehicle getVehicle() {
        return vehicle;
    }

    /**
     * @param vehicle the vehicle to set
     */
    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }

    /**
     * @return the ratetour
     */
    public Set<RateTour> getRatetour() {
        return ratetour;
    }

    /**
     * @param ratetour the ratetour to set
     */
    public void setRatetour(Set<RateTour> ratetour) {
        this.ratetour = ratetour;
    }

}
