/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers.admin;

/**
 *
 * @author ADMIN
 */

import com.ctt.pojos.Category;
import com.ctt.pojos.Payments;
import com.ctt.pojos.StatusPayment;
import com.ctt.service.CategoryService;
import com.ctt.service.PaymentService;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import org.springframework.stereotype.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class ApiChartController {
    @Autowired
    private PaymentService paymentService;
    @Autowired
    private CategoryService categoryService;
    @PostMapping(path = "/piechart", produces={
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<HashMap<Integer, HashMap<String, BigDecimal>>> pieChart(@RequestBody Map<String, String> params) throws ParseException{
        HashMap<Integer, HashMap<String, BigDecimal>> totalPrice = new HashMap<Integer, HashMap<String, BigDecimal>>();
        List<Payments> listPayments = this.paymentService.getPayments(0, null);
        List<Category> listCategory = this.categoryService.getCategories();
        HashMap<String, BigDecimal> price, ticket;
        int year = Integer.parseInt(params.getOrDefault("year", "2021"));
        for(Category c: listCategory){
            price = new HashMap<String, BigDecimal>();
            price.put(c.getName(), BigDecimal.ZERO);
            totalPrice.put(c.getId(), price);
        }
        price = new HashMap<String, BigDecimal>();
        price.put("totalPrice", BigDecimal.ZERO);
        totalPrice.put(0, price);
        ticket = new HashMap<String, BigDecimal>();
        ticket.put("totalTicket", BigDecimal.ZERO);
        totalPrice.put(-1, ticket);
        for(Payments c : listPayments ){
            if(c.getStatus() == StatusPayment.PAID){
                Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
                cal.setTime(c.getCreatedDate());
                int y = cal.get(Calendar.YEAR);
                if(year == y){
                    price = new HashMap<String, BigDecimal>();
                    price.put(c.getTour().getCategory().getName(), totalPrice.get(c.getTour().getCategory().getId()).get(c.getTour().getCategory().getName()).add(c.getPrice()));
                    totalPrice.put(c.getTour().getCategory().getId(), price);
                    price = new HashMap<String, BigDecimal>();
                    price.put("totalPrice", totalPrice.get(0).get("totalPrice").add(c.getPrice()));
                    ticket = new HashMap<String, BigDecimal>();
                    ticket.put("totalTicket", totalPrice.get(-1).get("totalTicket").add(BigDecimal.valueOf(c.getAdult() + c.getChildren())));
                    totalPrice.put(0, price);
                    totalPrice.put(-1, ticket);
                }
            }
        }
        return new ResponseEntity<>(totalPrice,HttpStatus.OK);
    }
    @PostMapping(path = "/columnchart", produces={
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<HashMap<Integer, HashMap<String, BigDecimal>>> columnChart(@RequestBody Map<String, String> params) throws ParseException{
        HashMap<Integer, HashMap<String, BigDecimal>> totalPrice = new HashMap<Integer, HashMap<String, BigDecimal>>();
        HashMap<String, BigDecimal> price;
        int year = Integer.parseInt(params.getOrDefault("year", "2021"));
        List<Payments> listPayments = this.paymentService.getPayments(0, null);
        for(int i = 1; i <= 12; i++){
          price = new HashMap<String, BigDecimal>();
          price.put("adult", BigDecimal.ZERO);
          price.put("children", BigDecimal.ZERO);
          price.put("totalTicket", BigDecimal.ZERO);
          totalPrice.put(i, price);
        };
        for(final Payments c : listPayments ){
            if(c.getStatus() == StatusPayment.PAID){
                Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
                cal.setTime(c.getCreatedDate());
                int month = cal.get(Calendar.MONTH) + 1;
                int y = cal.get(Calendar.YEAR);
                if(year == y){
                    price = new HashMap<String, BigDecimal>();
                    price.put("adult", totalPrice.get(month).get("adult").add(c.getTour().getPrice().multiply(BigDecimal.valueOf(c.getAdult()))));
                    price.put("children", totalPrice.get(month).get("children").add(c.getTour().getPrice().multiply(BigDecimal.valueOf(c.getChildren())).multiply(BigDecimal.valueOf(70).divide(BigDecimal.valueOf(100)))));
                    price.put("totalTicket", totalPrice.get(month).get("totalTicket").add(BigDecimal.valueOf(c.getAdult() + c.getChildren())));
                    totalPrice.put(month, price);
                }
            }
        }
        
        return new ResponseEntity<HashMap<Integer, HashMap<String, BigDecimal>>>(totalPrice,HttpStatus.OK);
    }
}
