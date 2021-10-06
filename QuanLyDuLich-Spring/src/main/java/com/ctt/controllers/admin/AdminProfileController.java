/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author ADMIN
 */
@Controller
public class AdminProfileController {
    @GetMapping("/admin/profile")
    public String adminProfile(Model model){
        return "adminProfileLayout";
    }
    
    @GetMapping("/admin/edit-tour")
    public String adminEditTour(Model model){
        return "adminEditTourLayout";
    }
}
