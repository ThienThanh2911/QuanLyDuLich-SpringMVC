/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers;

import com.ctt.pojos.Payments;
import com.ctt.service.DateDetailService;
import com.ctt.service.PaymentService;
import com.ctt.service.TourService;
import com.ctt.service.UserService;
import java.math.BigDecimal;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ADMIN
 */
@RestController
public class ApiPaymentController {
    @Autowired
    private PaymentService paymentService;
    @Autowired
    private UserService userService;
    @Autowired
    private TourService tourService;
    @Autowired
    private DateDetailService dateDetailService;
    
    @PostMapping(path = "/api/add-payment", produces={
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Payments> addPayment(@RequestBody Map<String, String> params){
        Payments c = this.paymentService.addPayment(this.userService.getUsers(params.get("user"), 1).get(0),
                                                    this.tourService.getTours(params.get("tour"), null, null, null, null, 0).get(0),
                                                    BigDecimal.valueOf(Double.valueOf(params.get("price"))),
                                                    Integer.valueOf(params.get("adult")),
                                                    Integer.valueOf(params.get("children")),
                                                    Integer.valueOf(params.get("method")),
                                                    this.dateDetailService.getDateDetailById(Integer.valueOf(params.get("datedetail"))));
        if(c == null)
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        return new ResponseEntity<>(c, HttpStatus.CREATED);
    }
}
