/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers;

import com.ctt.service.CategoryService;
import com.ctt.service.ProvinceService;
import com.ctt.service.TourService;
import com.ctt.service.UserService;
import java.security.Principal;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Windows-1909
 */
@Controller
@ControllerAdvice
public class HomeController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProvinceService provinceService;
    @Autowired
    private TourService tourService;
    @Autowired
    private UserService userDetailsService;
    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("categories", this.categoryService.getCategories());
        model.addAttribute("provinces", this.provinceService.getProvinces());
    }
    
    @RequestMapping("/")
    public String index(Model model, Principal principal) {
        if(principal != null)
            model.addAttribute("user", this.userDetailsService.getUsers(principal.getName()).get(0));
        model.addAttribute("toursNew", this.tourService.getToursNew());
        return "homeLayout";
    }
    
    @RequestMapping("/about")
    public String about(Model model) {
        return "aboutLayout";
    }
    
    @RequestMapping("/contact")
    public String contact(Model model) {
        return "contactLayout";
    }
    
    @RequestMapping("/membership")
    public String membership(Model model) {
        return "membershipLayout";
    }
    
    @RequestMapping("/terms")
    public String terms(Model model) {
        return "termsLayout";
    }
    
    @RequestMapping("/payment-history")
    public String paymentHistory(Model model) {
        return "paymentHistoryLayout";
    }
    
    @RequestMapping("/invoice-details")
    public String invoiceDetails(Model model) {
        return "invoiceDetailsLayout";
    }
}
