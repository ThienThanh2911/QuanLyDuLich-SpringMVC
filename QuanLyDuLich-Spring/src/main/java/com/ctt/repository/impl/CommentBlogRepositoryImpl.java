/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository.impl;

import com.ctt.pojos.CommentBlog;
import com.ctt.repository.CommentBlogRepository;
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
public class CommentBlogRepositoryImpl implements CommentBlogRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;

    @Override
    @Transactional
    public CommentBlog addCommentBlog(CommentBlog c) {
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
    public void removeCommentBlog(CommentBlog c) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.delete(c);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    @Override
    @Transactional
    public CommentBlog getCommentBlogById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<CommentBlog> query = builder.createQuery(CommentBlog.class);
        Root root = query.from(CommentBlog.class);

        Predicate p = builder.equal(root.get("id"), id);
        query = query.where(p);
        
        Query q = session.createQuery(query);

        return (CommentBlog) q.getSingleResult();
    }
    
    
    
}
