/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers;

import com.ctt.service.CategoryService;
import com.ctt.service.TourService;
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
    private TourService tourService;
    
    @ModelAttribute
    public void commonAttr(Model model) {
        model.addAttribute("categories", this.categoryService.getCategories());
    }
    
    @RequestMapping("/")
    public String index(Model model) {
        model.addAttribute("categories", this.categoryService.getCategories());
        return "homeLayout";
    }
    
    @RequestMapping("/packages")
    @Transactional
    public String packages(Model model,
            @RequestParam(required = false) Map<String, String> params) {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("categories", this.categoryService.getCategories());
        model.addAttribute("tours", this.tourService.getTours(params.get("kw"), page));
        model.addAttribute("count", this.tourService.getTours(params.get("kw"), page).size());
        /*if(!params.isEmpty()){
            if(params.get("page").equals("1"))
                model.addAttribute("pageLink", "1");
            else
                model.addAttribute("pageLink", Integer.parseInt(params.get("page"))-1);
        }else
            model.addAttribute("pageLink", "1");*/
        return "packagesLayout";
    }
    
    @RequestMapping("/package-details")
    public String packageDetails(Model model) {
        return "packageDetailsLayout";
    }
    
    @RequestMapping("/change-password")
    public String changePassword(Model model) {
        return "changePasswordLayout";
    }
    
    @RequestMapping("/about")
    public String about(Model model) {
        return "aboutLayout";
    }
    
    @RequestMapping("/blog")
    public String blog(Model model) {
        return "blogLayout";
    }
    
    @RequestMapping("/blog-details")
    public String blogDetails(Model model) {
        return "blogDetailsLayout";
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
}
