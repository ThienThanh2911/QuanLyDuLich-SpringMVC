/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository.impl;

import com.ctt.pojos.Tours;
import com.ctt.repository.TourRepository;
import java.math.BigDecimal;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
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
    public List<Tours> getTourById(String id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Tours> query = builder.createQuery(Tours.class);
        Root root = query.from(Tours.class);

        Predicate p = builder.equal(root.get("id"), id);
        query = query.where(p);
        
        Query q = session.createQuery(query);

        return q.getResultList();
    }
    
    @Override
    public List<Tours> getTours(String kw, String cate, String date, String priceMin, String priceMax, int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Tours> query = builder.createQuery(Tours.class);
        Root root = query.from(Tours.class);
        query = query.select(root).orderBy(builder.desc(root.get("id")));
        List<Predicate> ps = new ArrayList<>();
        if(kw != null)
            ps.add(builder.like(root.get("name").as(String.class), String.format("%%%s%%", kw)));
        System.out.println("kw: "+kw+" cate: "+cate+" date: "+date+" priceMin: "+priceMin+" priceMax: "+priceMax);
        if(cate != null && !cate.equals(""))
            ps.add(builder.equal(root.get("category"), Integer.parseInt(cate)));
        if(date != null)
            ps.add(builder.like(root.get("startDate").as(String.class), String.format("%%%s%%", date)));
        if (priceMin == null || priceMin.equals(""))
            priceMin = "0";
        if (priceMax == null || priceMax.equals(""))
            priceMax = "100000000";
        Predicate pmi = builder.ge(root.get("price"), Integer.parseInt(priceMin));
        Predicate pma = builder.le(root.get("price"), Integer.parseInt(priceMax));
        ps.add(builder.and(pmi, pma));

        query = query.where(builder.and(ps.toArray(new Predicate[ps.size()])));

        Query q = session.createQuery(query);
        if(ps.isEmpty()){
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
            session.saveOrUpdate(tours);
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
