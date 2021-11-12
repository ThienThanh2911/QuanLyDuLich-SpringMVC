/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository.impl;

import com.ctt.pojos.Payments;
import com.ctt.repository.PaymentRepository;
import java.util.List;
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
            session.saveOrUpdate(c);
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

    @Override
    @Transactional
    public List<Payments> getPayments(int page, String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Payments> query = builder.createQuery(Payments.class);
        Root root = query.from(Payments.class);
        query = query.select(root).orderBy(builder.desc(root.get("id")));
        if(username != null){
            Predicate p = builder.equal(root.join("user").get("username").as(String.class), username);
            query = query.where(p);
        }
        Query q = session.createQuery(query);
        if(page != 0){
            int max = 9;
            q.setMaxResults(max);
            q.setFirstResult((page - 1) * max);
        }
        return q.getResultList();
    }

    @Override
    @Transactional
    public void removePayment(Payments payment) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.delete(payment);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    @Transactional
    public long countPayments() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("Select Count(*) From Payments");
        
        return Long.parseLong(q.getSingleResult().toString());
    }

    @Override
    @Transactional
    public List<Payments> getUnpaidPayments() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Payments> query = builder.createQuery(Payments.class);
        Root root = query.from(Payments.class);
        query = query.select(root).orderBy(builder.desc(root.get("id")));
        Predicate p = builder.like(root.get("status").as(String.class), "1");
        query = query.where(p);
        Query q = session.createQuery(query);
        return q.getResultList();
    }
    
    
}
