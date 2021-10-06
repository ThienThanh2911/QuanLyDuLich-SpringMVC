/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers.admin;

import com.ctt.pojos.Tours;
import com.ctt.service.TourService;
import com.ctt.validator.WebAppValidator;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public void initBinder(WebDataBinder binder) {
        binder.setValidator(tourValidator);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");   
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, null,  new CustomDateEditor(dateFormat, true));
    }
    
        
    @RequestMapping("/admin/packages")
    @Transactional
    public String adminPackagesView(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException{
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("countPage", (int)Math.ceil((double)this.tourService.countTours()/9));        
        model.addAttribute("packages", this.tourService.getTours(null, null, null, null, null, page));
        
        return "adminPackagesLayout";
    }

    
    @GetMapping("/admin/packages/{tourId}/edit")
    public String adminPackagesEditView(Model model, @PathVariable("tourId") String tourId) {
        model.addAttribute("packages", this.tourService.getTourById(Integer.parseInt(tourId)));
        return "adminPackagesLayout";
    }
    
    @PostMapping(path="/admin/packages/{tourId}/edit")
    public String adminPackagesEdit(Model model, @ModelAttribute(value =  "packages") @Valid Tours tours,
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
