/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service;

import com.ctt.pojos.Payments;
import java.util.List;


/**
 *
 * @author ADMIN
 */
public interface PaymentService {
    Payments addPayment(Payments payment);
    Payments getPaymentById(int id);
    List<Payments> getPayments(int page, String username);
    void removePayment(Payments payment);
    long countPayments();
    List<Payments> getUnpaidPayments();
}
