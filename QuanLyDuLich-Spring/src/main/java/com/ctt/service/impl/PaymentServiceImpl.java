/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service.impl;

import com.ctt.pojos.Payments;
import com.ctt.repository.PaymentRepository;
import com.ctt.service.PaymentService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class PaymentServiceImpl implements PaymentService {
    @Autowired
    private PaymentRepository paymentRepository;

    @Override
    public Payments addPayment(Payments p) {
        return this.paymentRepository.addPayment(p);
    }

    @Override
    public Payments getPaymentById(int id) {
        return this.paymentRepository.getPaymentById(id);
    }

    @Override
    public List<Payments> getPayments(int i, String username) {
        return this.paymentRepository.getPayments(i, username);
    }

    @Override
    public void removePayment(Payments pmnts) {
        this.paymentRepository.removePayment(pmnts);
    }

    @Override
    public long countPayments() {
        return this.paymentRepository.countPayments();
    }

    @Override
    public List<Payments> getUnpaidPayments() {
        return this.paymentRepository.getUnpaidPayments();
    }
    
    
}
