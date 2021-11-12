/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers;

import com.ctt.pojos.DateDetail;
import com.ctt.pojos.TourImage;
import com.ctt.service.CommentTourService;
import com.ctt.service.DateDetailService;
import com.ctt.service.RateTourService;
import com.ctt.service.TourImageService;
import com.ctt.service.TourService;
import com.ctt.service.UserService;
import com.ctt.validator.WebAppValidator;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Windows-1909
 */
@Controller
public class ToursController {
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
    private TourImageService tourImageService;
    @Autowired
    private DateDetailService dateDetailService;
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setValidator(tourValidator);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");   
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, null,  new CustomDateEditor(dateFormat, true));
    }

    
    @RequestMapping("/packages")
    @Transactional
    public String packages(Model model,
            @RequestParam(required = false) Map<String, String> params) throws ParseException {
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("tours", this.tourService.getTours(params.get("kw"), params.get("cate"), params.get("date"), params.get("priceMin"), params.get("priceMax"), true, page));
        model.addAttribute("count", this.tourService.countTours());
        model.addAttribute("countPage", (int)Math.ceil((double)this.tourService.countTours()/9));
        model.addAttribute("toursNew", this.tourService.getToursNew());
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
            model.addAttribute("rate", this.rateTourService.getRateTour(this.userDetailsService.getUsers(principal.getName(), 1).get(0).getId(), Integer.parseInt(tourId)));
            model.addAttribute("user", this.userDetailsService.getUsers(principal.getName(), 1).get(0));
        }
        model.addAttribute("tour", this.tourService.getTourById(Integer.parseInt(tourId)));
        List<TourImage> t = this.tourImageService.getTourImageById(Integer.parseInt(tourId));
        String a1 = t.get(0).getImage();
        String a2 = t.get(1).getImage();
        String a3 = t.get(2).getImage();
        model.addAttribute("tourimage1", a1);
        model.addAttribute("tourimage2", a2);
        model.addAttribute("tourimage3", a3);
        model.addAttribute("dates", this.dateDetailService.getListDateDetailById(Integer.parseInt(tourId)));
        model.addAttribute("comments", this.commentTourService.getListCommentsTourById(Integer.parseInt(tourId)));
        return "packageDetailsLayout";
    }
}
