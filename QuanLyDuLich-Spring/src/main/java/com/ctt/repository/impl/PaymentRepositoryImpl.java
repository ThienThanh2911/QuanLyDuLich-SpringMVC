/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository.impl;

import com.ctt.pojos.Payments;
import com.ctt.repository.PaymentRepository;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ADMIN
 */
@Repository
public class PaymentRepositoryImpl implements PaymentRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    @Transactional
    public Payments addPayment(Payments c) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.save(c);
            return c;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    @Transactional
    public Payments getPaymentById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Payments> query = builder.createQuery(Payments.class);
        Root root = query.from(Payments.class);

        Predicate p = builder.equal(root.get("id"), id);
        query = query.where(p);
        
        Query q = session.createQuery(query);

        return (Payments) q.getSingleResult();
    }
    
}
