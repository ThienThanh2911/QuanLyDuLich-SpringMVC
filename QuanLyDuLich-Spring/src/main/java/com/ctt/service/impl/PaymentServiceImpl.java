/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service.impl;

import com.ctt.pojos.DateDetail;
import com.ctt.pojos.Methods;
import com.ctt.pojos.Payments;
import com.ctt.pojos.Tours;
import com.ctt.pojos.User;
import com.ctt.repository.PaymentRepository;
import com.ctt.service.PaymentService;
import java.math.BigDecimal;
import java.util.Date;
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
    public Payments addPayment(User user, Tours tour, BigDecimal price, int adult, int children, int method, DateDetail datedetail) {
        Payments p = new Payments();
        p.setUser(user);
        p.setTour(tour);
        p.setPrice(price);
        p.setAdult(adult);
        p.setChildren(children);
        p.setCreatedDate(new Date());
        p.setMethod(Methods.values()[0]);
        p.setDatedetail(datedetail);
        p.setStatus("Đã thanh toán");
        p.setDescription("Bạn đã chọn thanh toán qua Momo");
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
    
    
}
