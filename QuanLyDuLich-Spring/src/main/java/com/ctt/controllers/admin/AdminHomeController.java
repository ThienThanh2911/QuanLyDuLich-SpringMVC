/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers.admin;

import com.ctt.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author ADMIN
 */
@Controller
public class AdminHomeController {
    @Autowired
    private PaymentService paymentService;
    @GetMapping("/admin")
    public String adminHome(Model model) {
        model.addAttribute("unpaidpayments", this.paymentService.getUnpaidPayments());
        return "adminDashboardLayout";
    }
}
