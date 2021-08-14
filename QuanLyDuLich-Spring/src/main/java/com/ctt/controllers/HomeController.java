/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers;

import com.ctt.service.CategoryService;
import com.ctt.service.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Windows-1909
 */
@Controller
public class HomeController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private TourService tourService;
    
    @RequestMapping("/")
    public String index(Model model) {
        model.addAttribute("categories", this.categoryService.getCategories());
        return "homeLayout";
    }
    
    @RequestMapping("/packages")
    public String packages(Model model) {
        model.addAttribute("tours", this.tourService.getTours(""));
        return "packagesLayout";
    }
    
    @RequestMapping("/package-details")
    public String packageDetails(Model model) {
        return "packageDetailsLayout";
    }
    
    @RequestMapping("/your-profile")
    public String yourProfile(Model model) {
        return "profileLayout";
    }
    
    @RequestMapping("/signin")
    public String signIn(Model model) {
        return "signInLayout";
    }
    
    @RequestMapping("/signup")
    public String signUp(Model model) {
        return "signUpLayout";
    }
    
    @RequestMapping("/change-password")
    public String changePassword(Model model) {
        return "changePasswordLayout";
    }
}
