/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service;

import com.ctt.pojos.User;
import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author ADMIN
 */
public interface UserService extends UserDetailsService{
    boolean addOrUpdateUser(User user);
    List<User> getUsers(String username);
    List<User> getUsersByEmail(String email);
    boolean changePassword(User user,String oldPassword, String password);
}
