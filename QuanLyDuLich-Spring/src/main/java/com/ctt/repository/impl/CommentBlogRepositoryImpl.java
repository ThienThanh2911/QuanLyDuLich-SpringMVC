/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository.impl;

import com.ctt.pojos.CommentBlog;
import com.ctt.repository.CommentBlogRepository;
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

    @Override
    @Transactional
    public List<CommentBlog> getListCommentsBlogById(int blogId) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<CommentBlog> query = builder.createQuery(CommentBlog.class);
        Root root = query.from(CommentBlog.class);

        Predicate p = builder.equal(root.get("blog"), blogId);
        query = query.where(p);

        Query q = session.createQuery(query);
        return q.getResultList();
    }

    @Override
    @Transactional
    public List<CommentBlog> getCommentBlogs(int page) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<CommentBlog> query = builder.createQuery(CommentBlog.class);
        Root root = query.from(CommentBlog.class);
        query = query.select(root).orderBy(builder.desc(root.get("id")));
        
        Query q = session.createQuery(query);
        int max = 9;
        q.setMaxResults(max);
        q.setFirstResult((page - 1) * max);
        return q.getResultList();
    }

    @Override
    @Transactional
    public long countCommentBlogs() {
        Session s = this.sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("Select Count(*) From CommentBlog");
        
        return Long.parseLong(q.getSingleResult().toString());
    }
    
    
    
}
