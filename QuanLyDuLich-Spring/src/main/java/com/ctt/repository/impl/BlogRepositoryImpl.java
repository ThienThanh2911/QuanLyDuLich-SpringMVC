/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository.impl;

import com.ctt.pojos.Blog;
import com.ctt.repository.BlogRepository;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ADMIN
 */
@Repository
@Transactional
public class BlogRepositoryImpl implements BlogRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    @Transactional
    public List<Blog> getBlogs(String kw) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Blog> query = builder.createQuery(Blog.class);
        Root root = query.from(Blog.class);
        query = query.select(root).orderBy(builder.desc(root.get("id")));
        if(kw != null && !kw.equals("")){
            Predicate p = builder.like(root.get("title").as(String.class), String.format("%%%s%%", kw));
            query = query.where(p);
        }
        
        query = query.select(root); 
        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    public Blog getBlogById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Blog> query = builder.createQuery(Blog.class);
        Root root = query.from(Blog.class);

        Predicate p = builder.equal(root.get("id"), id);
        query = query.where(p);
        
        org.hibernate.query.Query q = session.createQuery(query);

        return (Blog) q.getSingleResult();
    }
    
    
}
