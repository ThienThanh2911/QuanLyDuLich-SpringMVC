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
import org.hibernate.HibernateException;
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
    public List<Blog> getBlogs(String kw, int page, boolean isActive) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Blog> query = builder.createQuery(Blog.class);
        Root root = query.from(Blog.class);
        query = query.select(root).orderBy(builder.desc(root.get("id")));
        if(kw != null && !kw.equals("")){
            Predicate p = builder.like(root.get("title").as(String.class), String.format("%%%s%%", kw));
            query = query.where(p);
        }
        if(isActive){
            Predicate p1 = builder.equal(root.get("active"), true);
            query = query.where(p1);
        }
        query = query.select(root); 
        Query q = session.createQuery(query);
        int max = 9;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);
        return q.getResultList();
    }

    @Override
    public List<Blog> getBlogsNew() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Blog> query = builder.createQuery(Blog.class);
        Root root = query.from(Blog.class);
        query = query.select(root).orderBy(builder.desc(root.get("id")));
        
        Query q = session.createQuery(query);
        q.setMaxResults(3);
        
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
        
        Query q = session.createQuery(query);
        return (Blog) q.getSingleResult();
    }

    @Override
    public boolean addOrUpdateBlog(Blog blog) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.merge(blog);
            return true;
        }catch(HibernateException ex){
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public void removeBlog(Blog blog) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.delete(blog);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public long countBlogs() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("Select Count(*) From Blog");
        
        return Long.parseLong(q.getSingleResult().toString());
    }
    
    
}
