/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository.impl;

import com.ctt.pojos.Category;
import com.ctt.repository.CategoryRepository;
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
 * @author Windows-1909
 */
@Repository
public class CategoryRepositoryImpl implements CategoryRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    @Transactional
    public List<Category> getCategories() {
        Session s = sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Category");
        return q.getResultList();
    }

    @Override
    @Transactional
    public Category addCategory(Category cate) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.saveOrUpdate(cate);
            return cate;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    @Transactional
    public Category getCategoryById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Category> query = builder.createQuery(Category.class);
        Root root = query.from(Category.class);

        Predicate p = builder.equal(root.get("id"), id);
        query = query.where(p);
        
        org.hibernate.query.Query q = session.createQuery(query);

        return (Category) q.getSingleResult();
    }

    @Override
    @Transactional
    public void removeCategory(Category cate) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.delete(cate);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    
}
