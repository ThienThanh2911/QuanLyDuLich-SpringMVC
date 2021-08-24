/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers;

import com.ctt.pojos.User;
import com.ctt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author Windows-1909
 */
@Controller
public class UsersController {
    @Autowired
    private UserService userDetailsService;
    @GetMapping("/signin")
    public String login(Model model){
        return "signInLayout";
    }
    
    @GetMapping("/signup")
    public String signupView(Model model){
        model.addAttribute("user", new User());
        return "signUpLayout";
    }
    
    @PostMapping("/signup")
    public String signup(Model model, @ModelAttribute(value = "user") User user){
        String errMsg = "";
        if(user.getPassword().equals(user.getConfirmPassword())){
            if(this.userDetailsService.addUser(user) == true)
                return "redirect:/signin";
        }else
            errMsg = "Mat khau khong khop";
        model.addAttribute("errMsg", errMsg);
        return "signUpLayout";
    }
}
