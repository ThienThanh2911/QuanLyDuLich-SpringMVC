/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers.admin;

import com.ctt.pojos.Tours;
import com.ctt.service.TourService;
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
 * @author ADMIN
 */
@Controller
public class AdminPackagesController {
    @Autowired
    private TourService tourService;
    @Autowired
    private WebAppValidator tourValidator;
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setValidator(tourValidator);
    }
    @GetMapping("/admin/packages")
    public String adminPackagesView(Model model) {
        model.addAttribute("packages", new Tours());
        
        return "adminPackagesLayout";
    }
    
    @PostMapping(path="/admin/packages")
    public String adminPackages(Model model, @ModelAttribute(value =  "packages") @Valid Tours tours,
            BindingResult result) {
        if(!result.hasErrors()){
            if(this.tourService.addOrUpdate(tours) == true)
                return "redirect:/";
            else
                model.addAttribute("errMsg", "Something wrong!!!");
            }
        return "adminPackagesLayout";
    }
}
