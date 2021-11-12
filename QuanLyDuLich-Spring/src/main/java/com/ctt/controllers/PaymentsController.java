/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers;

import com.ctt.pojos.Payments;
import com.ctt.pojos.User;
import com.ctt.service.PaymentService;
import com.ctt.service.UserService;
import java.security.Principal;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ADMIN
 */
@Controller
public class PaymentsController {
    @Autowired
    private PaymentService paymentService;
    @Autowired
    private UserService userDetailsService;
    
    @RequestMapping("/payment-history")
    public String paymentHistory(Model model, @RequestParam(required = false) Map<String, String> params, Principal principal) {
        if(principal != null){
            User u = this.userDetailsService.getUsers(principal.getName(), 1).get(0);
            model.addAttribute("payments", this.paymentService.getPayments(0, u.getUsername()));
        }else{
            return "redirect:/";
        }
    return "paymentHistoryLayout";
    }
    
    @RequestMapping("/payment-history/{payId}")
    public String paymentDetails(Model model, @PathVariable("payId") String payId, Principal principal) {
        if(principal != null){
            User u = this.userDetailsService.getUsers(principal.getName(), 1).get(0);
            Payments p = this.paymentService.getPaymentById(Integer.parseInt(payId));
            if(p.getUser().getUsername().equals(u.getUsername())){
                model.addAttribute("payment", p);
                return "paymentDetailsLayout";
            }
        }else{
            return "redirect:/";
        }
        return "redirect:/payment-history";
    }
}
