/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers.admin;

import com.ctt.pojos.User;
import com.ctt.service.UserService;
import com.ctt.validator.WebAppValidator;
import java.security.Principal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ADMIN
 */
@Controller
public class AdminUsersController {
    @Autowired
    private UserService userDetailsService;
    @Autowired
    private WebAppValidator userValidator;
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setValidator(userValidator);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");   
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, null,  new CustomDateEditor(dateFormat, true));
    }
    @GetMapping("/admin/users")
    public String adminUsersView(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException{
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("users", this.userDetailsService.getUsers(params.getOrDefault("username", null), page));
        model.addAttribute("countPage", (int)Math.ceil((double)this.userDetailsService.countUsers()/9));        
        return "adminUsersLayout";
    }
    @GetMapping("/admin/users/{userId}/edit")
    public String adminUserView(Model model, @PathVariable("userId") String userId) throws ParseException{
        model.addAttribute("user", this.userDetailsService.getUserById(Integer.parseInt(userId)));
        return "adminEditUserLayout";
    }
    @PostMapping("/admin/users/{userId}/edit")
    public String adminUserEdit(Model model, @ModelAttribute(value = "user") User user, @PathVariable("userId") String userId, BindingResult result) throws ParseException{
        if(!result.hasErrors()){
            User userRoot = this.userDetailsService.getUserById(Integer.parseInt(userId));
            user.setUsername(userRoot.getUsername());
            user.setPassword(userRoot.getPassword());
            this.userDetailsService.addOrUpdateUser(user);
            return "redirect:/admin/users/"+userId+"/edit";
        }
        return "adminEditUserLayout";
    }
    @GetMapping("/admin/users/add")
    public String adminUserView(Model model){
        model.addAttribute("user", new User());
        return "adminAddUserLayout";
    }
    @PostMapping("/admin/users/add")
    public String adminUserEdit(Model model, @ModelAttribute(value = "user") @Valid User user, BindingResult result){
        if(!result.hasErrors()){
            this.userDetailsService.addOrUpdateUser(user);
            return "redirect:/admin/users";
        }
        return "adminAddUserLayout";
    }
    
    @GetMapping("/admin/profile")
    public String adminProfileView(Model model, Principal principal){
        if(principal != null){
            model.addAttribute("user", this.userDetailsService.getUsers(principal.getName(), 1).get(0));
            return "adminUserProfileLayout";
        }
        return "redirect:/signin";
    }

    @PostMapping("/admin/profile")
    public String adminProfile(Model model, @ModelAttribute(value = "user") User user, Principal principal, BindingResult result) throws ParseException{
        if(!result.hasErrors()){
            user.setUsername(principal.getName());
            User userRoot = this.userDetailsService.getUsers(principal.getName(), 1).get(0);
            user.setEmail(userRoot.getEmail());
            user.setRole(userRoot.getRole());
            user.setPassword(userRoot.getPassword());
            this.userDetailsService.addOrUpdateUser(user);
            return "redirect:/admin/users/"+userRoot.getId()+"/edit";
        }
        return "adminUserProfileLayout";
    }
}
