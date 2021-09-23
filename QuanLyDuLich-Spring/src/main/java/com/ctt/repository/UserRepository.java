/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository;

import com.ctt.pojos.User;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface UserRepository {
    boolean addOrUpdateUser(User user);
    List<User> getUsers(String username);
    User getUserByEmail(String email);
    User getUserById(int id);
}
