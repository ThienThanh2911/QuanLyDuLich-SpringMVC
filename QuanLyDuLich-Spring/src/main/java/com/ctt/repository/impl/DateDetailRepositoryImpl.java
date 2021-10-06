/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository.impl;

import com.ctt.pojos.DateDetail;
import com.ctt.repository.DateDetailRepository;
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
public class DateDetailRepositoryImpl implements DateDetailRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    @Transactional
    public List<DateDetail> getListDateDetailById(int tourId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<DateDetail> query = builder.createQuery(DateDetail.class);
        Root root = query.from(DateDetail.class);

        Predicate p = builder.equal(root.get("tour"), tourId);
        query = query.where(p);

        Query q = session.createQuery(query);
        return q.getResultList();
    }
    
    @Override
    @Transactional
    public boolean addDateDetail(DateDetail d) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.save(d);
            return true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
}
