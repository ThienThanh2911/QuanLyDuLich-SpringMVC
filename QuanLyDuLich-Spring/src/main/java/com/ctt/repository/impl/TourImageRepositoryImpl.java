/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository.impl;

import com.ctt.pojos.TourImage;
import com.ctt.pojos.Tours;
import com.ctt.repository.TourImageRepository;
import com.ctt.repository.TourRepository;
import java.util.ArrayList;
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
public class TourImageRepositoryImpl implements TourImageRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    public List<TourImage> getTourImageById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<TourImage> query = builder.createQuery(TourImage.class);
        Root root = query.from(TourImage.class);

        Predicate p = builder.equal(root.join("tour").get("id"), id);
        query = query.where(p);
        
        Query q = session.createQuery(query);

        return q.getResultList();
    }

    
    
}
