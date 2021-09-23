/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers;

import com.ctt.pojos.User;
import com.ctt.service.UserService;
import com.ctt.validator.WebAppValidator;
import java.security.Principal;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Windows-1909
 */
@Controller
public class UsersController {
    @Autowired
    private UserService userDetailsService;
    
    @Autowired
    private WebAppValidator userValidator;
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setValidator(userValidator);
    }
    
    @GetMapping("/signin")
    public String signin(Model model){
        return "signInLayout";
    }
    
    @GetMapping("/signup")
    public String signupView(Model model){
        model.addAttribute("user", new User());
        return "signUpLayout";
    }
    
    @PostMapping("/signup")
    public String signup(Model model, @ModelAttribute(value = "user") @Valid User user, BindingResult result){
        if(!result.hasErrors()){
            if(this.userDetailsService.addOrUpdateUser(user) == true)
                return "redirect:/signin";
        }
        return "signUpLayout";
    }

    @GetMapping("/change-password")
    public String changepasswordView(Model model){
        return "changePasswordLayout";
    }
    
    @PostMapping("/change-password")
    @Transactional
    public String changepassword(Model model , Principal principal,
            @RequestParam(required = false) Map<String, String> params) {
        User user = this.userDetailsService.getUsers(principal.getName()).get(0);
        String msgError = "";
        if(!params.get("oldPassword").trim().equals(params.get("newPassword").trim()))
            if(params.get("newPassword").trim().equals(params.get("confirmNewPassword").trim()))
                if(this.userDetailsService.changePassword(user, params.get("oldPassword"), params.get("newPassword")))
                    model.addAttribute("msgSuccess", "Đã đổi mật khẩu thành công!");
                else
                    msgError = "Mật khẩu cũ không đúng!";
            else
                msgError = "xac thuc khong chinh xac";
        else
            msgError = "moi va cu khong duoc giong nhau";
        System.out.println(msgError);
        if(!"".equals(msgError))
            model.addAttribute("msgError", msgError);
        return "changePasswordLayout";
    }
    
    @GetMapping("/your-profile")
    public String profileView(Model model, Principal principal){
        if(principal != null){
            model.addAttribute("user", this.userDetailsService.getUsers(principal.getName()).get(0));
            model.addAttribute("provinceId", this.userDetailsService.getUsers(principal.getName()).get(0).getProvince().getId());
            return "profileLayout";
        }
        return "redirect:/signin";
    }

    @PostMapping("/your-profile")
    public String profile(Model model, @ModelAttribute(value = "user") User user, Principal principal){
        user.setUsername(principal.getName());
        User userRoot = this.userDetailsService.getUsers(principal.getName()).get(0);
        user.setEmail(userRoot.getEmail());
        user.setRole(userRoot.getRole());
        user.setPassword(userRoot.getPassword());
        this.userDetailsService.addOrUpdateUser(user);
        return "profileLayout";
    }
}
