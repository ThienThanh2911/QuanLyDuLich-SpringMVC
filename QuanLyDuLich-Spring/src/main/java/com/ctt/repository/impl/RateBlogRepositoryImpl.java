/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository.impl;

import com.ctt.pojos.RateBlog;
import com.ctt.pojos.RateTour;
import com.ctt.repository.RateBlogRepository;
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
public class RateBlogRepositoryImpl implements RateBlogRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;  

    @Override
    @Transactional
    public void setRateBlog(RateBlog r) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.saveOrUpdate(r);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    @Transactional
    public int getRateBlog(int userId, int blogId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<RateBlog> query = builder.createQuery(RateBlog.class);
        Root root = query.from(RateBlog.class);

        Predicate p = builder.equal(root.get("user"), userId);
        Predicate p2 = builder.equal(root.get("blog"), blogId);
        query = query.where(builder.and(p, p2));
        
        Query q = session.createQuery(query);

        if(!q.getResultList().isEmpty()) {
            RateBlog t = (RateBlog)q.getResultList().get(0);
            return t.getRate();
        } else {
            return 0;
        }
        
    }

    @Override
    @Transactional
    public List<RateBlog> getListRateBlog(int blogId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<RateBlog> query = builder.createQuery(RateBlog.class);
        Root root = query.from(RateBlog.class);

        Predicate p = builder.equal(root.get("blog"), blogId);
        query = query.where(p);
        
        Query q = session.createQuery(query);

        return q.getResultList();
    }
    
    
}
