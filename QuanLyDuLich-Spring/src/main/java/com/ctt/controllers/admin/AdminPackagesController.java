/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers.admin;

import com.ctt.pojos.DateDetail;
import com.ctt.pojos.Tours;
import com.ctt.service.CategoryService;
import com.ctt.service.DateDetailService;
import com.ctt.service.TagService;
import com.ctt.service.TourService;
import com.ctt.validator.WebAppValidator;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
    @Autowired
    private DateDetailService dateDetailService;
    @Autowired
    private TagService tagService;
    @Autowired
    private CategoryService categoryService;
    public void initBinder(WebDataBinder binder) {
        binder.addValidators(tourValidator);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");   
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, null,  new CustomDateEditor(dateFormat, true));
    }
    
        
    @RequestMapping("/admin/packages")
    @Transactional
    public String adminPackagesView(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException{
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("countPage", (int)Math.ceil((double)this.tourService.countTours()/9));        
        model.addAttribute("packages", this.tourService.getTours(params.getOrDefault("tourname", null), null, null, null, null, false, page));
        
        return "adminPackagesLayout";
    }

    
    @GetMapping("/admin/packages/add")
    public String adminPackagesAddView(Model model) {
        model.addAttribute("tour", new Tours());
        model.addAttribute("listTags", this.tagService.getTags());
        model.addAttribute("listCates", this.categoryService.getCategories());
        return "adminAddTourLayout";
    }
    
    @PostMapping(path="/admin/packages/add")
    public String adminPackagesAdd(Model model, @ModelAttribute(value =  "tour") @Valid Tours tours,
            BindingResult result) {
        if(!result.hasErrors()){
            if(this.tourService.addOrUpdate(tours) == true)
                return "redirect:/admin/packages";
            else
                model.addAttribute("errMsg", "Something wrong!!!");
            }
        return "adminAddTourLayout";
    }

    @GetMapping("/admin/packages/{tourId}/edit")
    public String adminPackagesEditView(Model model, @PathVariable("tourId") String tourId) {
        model.addAttribute("tour", this.tourService.getTourById(Integer.parseInt(tourId)));
        model.addAttribute("date", new DateDetail());
        model.addAttribute("listTags", this.tagService.getTags());
        model.addAttribute("listCates", this.categoryService.getCategories());
        model.addAttribute("datedetails", this.dateDetailService.getListDateDetailById(Integer.parseInt(tourId)));
        return "adminEditTourLayout";
    }
    
    @PostMapping(path="/admin/packages/{tourId}/edit")
    public String adminPackagesEdit(Model model, @PathVariable("tourId") String tourId, @ModelAttribute(value =  "tour") @Valid Tours tours,
            BindingResult result) {
        if(!result.hasErrors()){
            tours.setId(Integer.parseInt(tourId));
            if(this.tourService.addOrUpdate(tours) == true)
                return "redirect:/admin/packages/"+tours.getId()+"/edit";
            else
                model.addAttribute("errMsg", "Something wrong!!!");
        }
        return "adminEditTourLayout";
    }
}
