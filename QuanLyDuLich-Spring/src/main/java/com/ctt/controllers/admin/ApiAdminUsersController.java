/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers.admin;

/**
 *
 * @author ADMIN
 */


import com.ctt.pojos.User;
import org.springframework.stereotype.Controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.ctt.service.UserService;
import java.util.Map;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
@Controller
public class ApiAdminUsersController {
    @Autowired
    private UserService userService;
    
    @PostMapping(path = "/admin/api/users/set-active-user", produces={
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<User> setActiveUser(@RequestBody Map<String, String> params){
        User c = this.userService.getUserById(Integer.parseInt(params.get("userId")));
        c.setActive(!c.isActive());
        if(!this.userService.addOrUpdateUser(c))
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    
    @DeleteMapping(path = "/admin/api/users/remove-user/{userId}")
    public void removeUser(@PathVariable("userId") String userId){
        this.userService.removeUser(this.userService.getUserById(Integer.parseInt(userId)));
    }
}
