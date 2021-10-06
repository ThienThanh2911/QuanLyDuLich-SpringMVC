/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service;

import com.ctt.pojos.DateDetail;
import com.ctt.pojos.Payments;
import com.ctt.pojos.Tours;
import com.ctt.pojos.User;
import java.math.BigDecimal;


/**
 *
 * @author ADMIN
 */
public interface PaymentService {
    Payments addPayment(User user, Tours tour, BigDecimal price, int adult, int children, int method, DateDetail datedetail);
    Payments getPaymentById(int id);
}
