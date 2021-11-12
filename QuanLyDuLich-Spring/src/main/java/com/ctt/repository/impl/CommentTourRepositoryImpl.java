/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository.impl;

import com.ctt.pojos.CommentTour;
import com.ctt.repository.CommentTourRepository;
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
public class CommentTourRepositoryImpl implements CommentTourRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    @Transactional
    public CommentTour addCommentTour(CommentTour c) {
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
    public void removeCommentTour(CommentTour c) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.delete(c);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    @Override
    @Transactional
    public CommentTour getCommentById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<CommentTour> query = builder.createQuery(CommentTour.class);
        Root root = query.from(CommentTour.class);

        Predicate p = builder.equal(root.get("id"), id);
        query = query.where(p);
        
        Query q = session.createQuery(query);

        return (CommentTour) q.getSingleResult();
    }

    @Override
    @Transactional
    public List<CommentTour> getListCommentsTourById(int tourId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<CommentTour> query = builder.createQuery(CommentTour.class);
        Root root = query.from(CommentTour.class);

        Predicate p = builder.equal(root.get("tour"), tourId);
        query = query.where(p);

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    @Transactional
    public List<CommentTour> getCommentTours(int page, int tourId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<CommentTour> query = builder.createQuery(CommentTour.class);
        Root root = query.from(CommentTour.class);
        query = query.select(root).orderBy(builder.desc(root.get("id")));
        if(tourId != 0){
            Predicate p = builder.like(root.join("tour").get("id").as(String.class), String.format("%%%s%%", tourId));
            query = query.where(p);
        }
        Query q = session.createQuery(query);
        int max = 9;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);
        return q.getResultList();
    }

    @Override
    @Transactional
    public long countCommentTours() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("Select Count(*) From CommentTour");
        
        return Long.parseLong(q.getSingleResult().toString());
    }
    
    
    
}
