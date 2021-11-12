/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers.admin;

import com.ctt.pojos.Payments;
import com.ctt.service.PaymentService;
import java.text.ParseException;
import java.util.Map;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ADMIN
 */
@Controller
public class AdminPaymentsController {
    @Autowired
    private PaymentService paymentService;
    
    @GetMapping("/admin/payments")
    public String adminPaymentsView(Model model, @RequestParam(required = false) Map<String, String> params) throws ParseException{
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        model.addAttribute("payments", this.paymentService.getPayments(page, params.getOrDefault("username", null)));
        model.addAttribute("countPage", (int)Math.ceil((double)this.paymentService.countPayments()/9));        
        return "adminPaymentsLayout";
    }
    
    @GetMapping("/admin/payments/{paymentId}/edit")
    public String adminPaymentsEditView(Model model, @PathVariable("paymentId") String paymentId) {
        model.addAttribute("payment", this.paymentService.getPaymentById(Integer.parseInt(paymentId)));
        return "adminEditPaymentLayout";
    }
    
    @PostMapping(path="/admin/payments/{paymentId}/edit")
    public String adminPaymentsEdit(Model model, @PathVariable("paymentId") String paymentId, @ModelAttribute(value =  "payment") Payments payments) {
        Payments payRoot = this.paymentService.getPaymentById(Integer.parseInt(paymentId));
        payments.setId(Integer.parseInt(paymentId));
        payments.setDatedetail(payRoot.getDatedetail());
        if(this.paymentService.addPayment(payments) != null)
            return "redirect:/admin/payments/"+payments.getId()+"/edit";
        else
            model.addAttribute("errMsg", "Something wrong!!!");
        return "adminEditPaymentLayout";
    }
}
