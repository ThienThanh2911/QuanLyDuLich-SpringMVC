/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository.impl;

import com.ctt.pojos.Tours;
import com.ctt.repository.TourRepository;
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
 * @author Windows-1909
 */
@Repository
@Transactional
public class TourRepositoryImpl implements TourRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public List<Tours> getTours(String kw, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Tours> query = builder.createQuery(Tours.class);
        Root root = query.from(Tours.class);
        query = query.select(root);
        
        if(kw != null){
            Predicate p = builder.like(root.get("name").as(String.class), 
                    String.format("%%%s%%", kw));
            query = query.where(p);
        }
        
        Query q = session.createQuery(query);
        if(kw == null){
            int max = 9;
            q.setMaxResults(max);
            q.setFirstResult((page - 1) * max);
        }
        return q.getResultList();
    }

    @Override
    public boolean addOrUpdate(Tours tours) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.save(tours);
            return true;
        } catch (Exception ex) {
            System.err.println("ADD TOUR ==>" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }

    @Override
    public long countTours() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("Select Count(*) From Tours");
        
        return Long.parseLong(q.getSingleResult().toString());
    }
    
}
