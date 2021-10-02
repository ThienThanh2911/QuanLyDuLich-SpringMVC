/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.pojos;

import com.ctt.validator.UserEmail;
import com.ctt.validator.UserName;
import java.io.Serializable;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Windows-1909
 */
@Entity
@Table(name = "users")
public class User implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @NotEmpty(message = "{user.message.emptyError}")
    @Column(name = "first_name")
    private String firstName;
    @NotEmpty(message = "{user.message.emptyError}")
    @Column(name = "last_name")
    private String lastName;
    @NotEmpty(message = "{user.message.emptyError}")
    @Pattern(regexp = "^[A-Za-z0-9+_.-]+@gmail.com$", message = "{user.email.invalid}")
    @UserEmail(message = "{user.useremail.uniqueError}")
    private String email;
    @NotEmpty(message = "{user.message.emptyError}")
    @UserName(message = "{user.username.uniqueError}")
    private String username;
    @NotEmpty(message = "{user.message.emptyError}")
    private String password;
    @NotEmpty(message = "{user.message.emptyError}")
    private String street;
    @Temporal(javax.persistence.TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date birth;
    private String avatar;
    @NotEmpty(message = "{user.message.emptyError}")
    @Pattern(regexp = "\\d{10}", message = "{user.phone.invalid}")
    private String phone;
    //@NotEmpty(message = "{user.message.emptyError}")
    private String gender;
    private String about;
    private boolean active;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "province_id")
    //@NotNull(message = "{tour.category.nullError}")
    private Province province;
    @Column(name = "user_role")
    private Role role;
    @Transient
    private MultipartFile file;
    @Transient
    private String confirmPassword;
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private Set<Blog> blog;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "user", cascade = CascadeType.ALL)
    private Set<Payments> payments;
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private Set<TourBooking> tourbooking;
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private Set<RateTour> ratetour;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "user", cascade = CascadeType.ALL)
    @OrderBy("id")
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
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    /**
     * @return the provine
     */
    public Province getProvince() {
        return province;
    }

    /**
     * @param provine the provine to set
     */
    public void setProvince(Province province) {
        this.province = province;
    }

    /**
     * @return the role
     */
    public Role getRole() {
        return role;
    }

    /**
     * @param role the role to set
     */
    public void setRole(Role role) {
        this.role = role;
    }

    /**
     * @return the blog
     */
    public Set<Blog> getBlog() {
        return blog;
    }

    /**
     * @param blog the blog to set
     */
    public void setBlog(Set<Blog> blog) {
        this.blog = blog;
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
     * @return the active
     */


}
