/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ctt.pojos.Role;
import com.ctt.pojos.User;
import com.ctt.repository.UserRepository;
import com.ctt.service.UserService;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author ADMIN
 */
@Service("userDetailsService")
public class UserServiceImpl implements UserService{
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private BCryptPasswordEncoder passwordEncoder;
    
    @Override
    @Transactional
    public boolean addOrUpdateUser(User user) {
        boolean a = user.isActive();
        if(this.userRepository.getUsers(user.getUsername(), 1).isEmpty()){
            String password = user.getPassword();
            user.setPassword(this.passwordEncoder.encode(password));
            if(user.getRole().equals(""))
                user.setRole(Role.ROLE_USER);
            a = true;
        }else{
            user.setId(this.userRepository.getUsers(user.getUsername(), 1).get(0).getId());
        }
        MultipartFile img = user.getFile();
        if (img != null && !img.isEmpty()) {
            try {
                Map r = this.cloudinary.uploader().upload(user.getFile().getBytes(), 
                    ObjectUtils.asMap("resource_type", "auto"));
                user.setAvatar((String) r.get("secure_url"));
            } catch (IOException ex) {
                System.out.println(ex.getMessage());
            }
        }
        user.setActive(a);
        return this.userRepository.addOrUpdateUser(user);
    }

    @Override
    public boolean changePassword(User user, String oldPassword, String password) {
        if(this.passwordEncoder.matches(oldPassword.trim(), user.getPassword())){
            user.setPassword(this.passwordEncoder.encode(password.trim()));
            return true;
        }
        return false;
    }
    
    @Override
    public List<User> getUsers(String username, int page) {
        return this.userRepository.getUsers(username, page);
    }
    
    @Override
    public User getUserByEmail(String email) {
        return this.userRepository.getUserByEmail(email);
    }
    
    @Override
    public User getUserById(int id) {
        return this.userRepository.getUserById(id);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<User> users = this.getUsers(username, 1);
        if(users.isEmpty())
            throw new UsernameNotFoundException("User khong ton tai!!!");
        User u = users.get(0);
        Set<GrantedAuthority> authorities = new HashSet<>();
        authorities.add(new SimpleGrantedAuthority(u.getRole().toString()));
        return new org.springframework.security.core
                .userdetails.User(u.getUsername(), u.getPassword(), authorities);
    }

    @Override
    public void removeUser(User user) {
        this.userRepository.removeUser(user);
    }

    @Override
    public long countUsers() {
        return this.userRepository.countUsers();
    }
    
    
}
