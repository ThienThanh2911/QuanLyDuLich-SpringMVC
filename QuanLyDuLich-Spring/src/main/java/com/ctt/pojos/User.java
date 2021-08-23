/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.pojos;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Windows-1909
 */
@Entity
@Table(name = "users")
public class User implements Serializable {

    public static final String USER = "ROLE_USER";
    public static final String ADMIN = "ROLE_ADMIN";
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @NotEmpty(message = "{user.message.emptyError}")
    private String name;
    @NotEmpty(message = "{user.message.emptyError}")
    @Pattern(regexp = "^[A-Za-z0-9+_.-]+@ou.edu.vn$", message = "{user.email.invalid}")
    private String email;
    @NotEmpty(message = "{user.message.emptyError}")
    private String username;
    @NotEmpty(message = "{user.message.emptyError}")
    private String password;
    @NotEmpty(message = "{user.message.emptyError}")
    private String street;
    @NotEmpty(message = "{user.message.emptyError}")
    private String city;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date birth;
    private String avatar;
    @NotEmpty(message = "{user.message.emptyError}")
    @Pattern(regexp = "\\d{10}", message = "{user.phone.invalid}")
    private String phone;
    //@NotEmpty(message = "{user.message.emptyError}")
    private String gender;
    private String about;
    @Column(name = "role")
    private String userRole;
    private Boolean active;
    @Transient
    private MultipartFile file;
    @Transient
    private String confirmPassword;
    
    @OneToMany(mappedBy = "user")
    private Set<Payments> payments;
    @OneToMany(mappedBy = "user")
    private Set<TourBooking> tourbooking;
    @OneToMany(mappedBy = "user")
    private Set<RateTour> ratetour;
    @OneToMany(mappedBy = "user")
    private Set<CommentTour> commenttour;

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
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the street
     */
    public String getStreet() {
        return street;
    }

    /**
     * @param street the street to set
     */
    public void setStreet(String street) {
        this.street = street;
    }

    /**
     * @return the city
     */
    public String getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * @return the avatar
     */
    public String getAvatar() {
        return avatar;
    }

    /**
     * @param avatar the avatar to set
     */
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the about
     */
    public String getAbout() {
        return about;
    }

    /**
     * @param about the about to set
     */
    public void setAbout(String about) {
        this.about = about;
    }

    /**
     * @return the birth
     */
    public Date getBirth() {
        return birth;
    }

    /**
     * @param birth the birth to set
     */
    public void setBirth(Date birth) {
        this.birth = birth;
    }

    /**
     * @return the role
     */
    public String getRole() {
        return userRole;
    }

    /**
     * @param role the role to set
     */
    public void setRole(String role) {
        this.userRole = role;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the active
     */
    public Boolean getActive() {
        return active;
    }

    /**
     * @param active the active to set
     */
    public void setActive(Boolean active) {
        this.active = active;
    }

    /**
     * @return the confirmPassword
     */
    public String getConfirmPassword() {
        return confirmPassword;
    }

    /**
     * @param confirmPassword the confirmPassword to set
     */
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
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
     * @return the active
     */


}
