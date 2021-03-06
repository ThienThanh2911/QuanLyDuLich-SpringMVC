/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers;

import com.ctt.common.GooglePojo;
import com.ctt.common.GoogleUtils;
import com.ctt.pojos.User;
import com.ctt.service.UserService;
import com.ctt.validator.WebAppValidator;
import java.io.IOException;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.apache.http.client.ClientProtocolException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
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
import org.springframework.web.bind.annotation.RequestMapping;
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
    private GoogleUtils googleUtils;
    
    @Autowired
    private WebAppValidator userValidator;
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setValidator(userValidator);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");   
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, null,  new CustomDateEditor(dateFormat, true));
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

    @RequestMapping("/signin-google")
    public String loginGoogle(HttpServletResponse response, HttpServletRequest request) throws ClientProtocolException, IOException {
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            return "redirect:/signin?error=google_error";
        }
        String accessToken = googleUtils.getToken(code);
        response.addCookie(new Cookie("accessToken", accessToken));
        GooglePojo googlePojo = googleUtils.getUserInfo(accessToken);
        UserDetails userDetail = googleUtils.buildUser(googlePojo);
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null,
                userDetail.getAuthorities());
        authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        return "redirect:/";
    }

    @GetMapping("/change-password")
    public String changepasswordView(Model model){
        return "changePasswordLayout";
    }
    
    @PostMapping("/change-password")
    @Transactional
    public String changepassword(Model model, Principal principal,
            @RequestParam(required = false) Map<String, String> params) {
        User user = this.userDetailsService.getUsers(principal.getName(), 1).get(0);
        String msgError = "";
        if(!params.get("oldPassword").trim().equals(params.get("newPassword").trim()))
            if(params.get("newPassword").trim().equals(params.get("confirmNewPassword").trim()))
                if(this.userDetailsService.changePassword(user, params.get("oldPassword"), params.get("newPassword")))
                    model.addAttribute("msgSuccess", "???? ?????i m???t kh???u th??nh c??ng!");
                else
                    msgError = "M???t kh???u c?? kh??ng ????ng!";
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
            model.addAttribute("user", this.userDetailsService.getUsers(principal.getName(), 1).get(0));
            model.addAttribute("provinceId", this.userDetailsService.getUsers(principal.getName(), 1).get(0).getProvince().getId());
            return "profileLayout";
        }
        return "redirect:/signin";
    }

    @PostMapping("/your-profile")
    public String profile(Model model, @ModelAttribute(value = "user") User user, Principal principal){
        user.setUsername(principal.getName());
        User userRoot = this.userDetailsService.getUsers(principal.getName(), 1).get(0);
        user.setEmail(userRoot.getEmail());
        user.setRole(userRoot.getRole());
        user.setPassword(userRoot.getPassword());
        this.userDetailsService.addOrUpdateUser(user);
        return "profileLayout";
    }
}
