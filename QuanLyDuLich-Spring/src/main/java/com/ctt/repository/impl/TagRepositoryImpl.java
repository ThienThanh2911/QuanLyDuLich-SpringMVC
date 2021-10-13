/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository.impl;

import com.ctt.pojos.Tags;
import com.ctt.repository.TagRepository;
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
public class TagRepositoryImpl implements TagRepository {
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    @Override
    public List<Tags> getTags() {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Tags> query = builder.createQuery(Tags.class);
        Root root = query.from(Tags.class);
        query = query.select(root);
        
        Query q = session.createQuery(query);
        return q.getResultList();
    }
    @Override
    public Tags getTagById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Tags> query = builder.createQuery(Tags.class);
        Root root = query.from(Tags.class);

        Predicate p = builder.equal(root.get("id"), id);
        query = query.where(p);
        
        Query q = session.createQuery(query);

        return (Tags) q.getSingleResult();
    }

    @Override
    public Tags addTag(Tags tag) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.saveOrUpdate(tag);
            return tag;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public void removeTag(Tags tag) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.delete(tag);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    
}
