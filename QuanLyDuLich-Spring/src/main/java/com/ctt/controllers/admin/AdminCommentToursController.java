/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers.admin;

import com.ctt.service.CommentTourService;
import com.ctt.service.TourService;
import java.text.ParseException;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ADMIN
 */
@Controller
public class AdminCommentToursController {
    @Autowired
    private CommentTourService commentTourService;
    @Autowired
    private TourService tourService;
    
    @GetMapping("/admin/commenttours")
    public String adminCommentToursView(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException{
        int tourId = Integer.parseInt(params.getOrDefault("tourId", "0"));
        model.addAttribute("commenttours", this.commentTourService.getListCommentsTourById(tourId));
        model.addAttribute("tour", this.tourService.getTourById(tourId));
        return "adminCommentToursLayout";
    }
}
