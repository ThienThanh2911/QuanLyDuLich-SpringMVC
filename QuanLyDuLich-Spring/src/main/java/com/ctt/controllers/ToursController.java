/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers;

import com.cloudinary.Cloudinary;
import com.ctt.pojos.CommentTour;
import com.ctt.pojos.Tours;
import com.ctt.service.CategoryService;
import com.ctt.service.CommentTourService;
import com.ctt.service.DateDetailService;
import com.ctt.service.RateTourService;
import com.ctt.service.TourService;
import com.ctt.service.UserService;
import com.ctt.validator.WebAppValidator;
import java.math.BigDecimal;
import java.security.Principal;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Windows-1909
 */
@Controller
public class ToursController {
    @Autowired
    private Cloudinary cloudinary;
    @Autowired
    private UserService userDetailsService;
    @Autowired
    private RateTourService rateTourService;
    @Autowired
    private CommentTourService commentTourService;
    @Autowired
    private WebAppValidator tourValidator;
    @Autowired
    private TourService tourService;
    @Autowired
    private DateDetailService dateDetailService;
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setValidator(tourValidator);
    }

    
    @RequestMapping("/packages")
    @Transactional
    public String packages(Model model,
            @RequestParam(required = false) Map<String, String> params) throws ParseException {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("tours", this.tourService.getTours(params.get("kw"), params.get("cate"), params.get("date"), params.get("priceMin"), params.get("priceMax"), page));
        model.addAttribute("count", this.tourService.countTours());
        model.addAttribute("countPage", (int)Math.ceil((double)this.tourService.countTours()/9));
        /*if(!params.isEmpty()){
            if(params.get("page").equals("1"))
                model.addAttribute("pageLink", "1");
            else
                model.addAttribute("pageLink", Integer.parseInt(params.get("page"))-1);
        }else
            model.addAttribute("pageLink", "1");*/
        return "packagesLayout";
    }
    
    @RequestMapping("/package-details/{tourId}")
    public String packageDetails(Model model, @PathVariable("tourId") String tourId, Principal principal) {
        if(principal != null){
            model.addAttribute("rate", this.rateTourService.getRateTour(this.userDetailsService.getUsers(principal.getName()).get(0).getId(), Integer.parseInt(tourId)));
            model.addAttribute("user", this.userDetailsService.getUsers(principal.getName()).get(0));
        }
        model.addAttribute("tour", this.tourService.getTourById(Integer.parseInt(tourId)));
        model.addAttribute("dates", this.dateDetailService.getListDateDetailById(Integer.parseInt(tourId)));
        model.addAttribute("comments", this.commentTourService.getListCommentsTourById(Integer.parseInt(tourId)));
        return "packageDetailsLayout";
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
