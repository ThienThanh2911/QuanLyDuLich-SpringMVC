/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers;

import com.ctt.pojos.User;
import com.ctt.validator.WebAppValidator;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author Windows-1909
 */
@Controller
public class SignInController {
    /*@Autowired
    private UserService userService;
    @Autowired
    private WebAppValidator userValidator;
    
    @InitBinder
    public void InitBinder(WebDataBinder binder) {
        binder.setValidator(userValidator);
    }
    
    @GetMapping(value = "/signup")
    public String registerView(Model model) {
        model.addAttribute("user", new User());
        
        return "signup";
    }
    
    @PostMapping(value = "/signup")
    public String register(Model model, 
            @ModelAttribute(value = "user") @Valid User user,
            BindingResult result) {
        if (result.hasErrors()) 
            return "signup";
        
        //userService.addUser(user);
        return "redirect:/signin";
    }
    
    @GetMapping("/signin")
    public String loginView() {
        return "signin";
    }*/
}
