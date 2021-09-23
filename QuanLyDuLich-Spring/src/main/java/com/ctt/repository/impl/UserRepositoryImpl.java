/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository.impl;

import com.ctt.pojos.User;
import com.ctt.repository.UserRepository;
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
public class UserRepositoryImpl implements UserRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;
    
    @Override
    public boolean addOrUpdateUser(User user) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        try{
            session.merge(user);
            return true;
        }catch(HibernateException ex){
            System.err.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public List<User> getUsers(String username) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        
        if(username != null && !username.equals("")){
            Predicate p = builder.equal(root.get("username"), username.trim());
            query = query.where(p);
        }
        
        query = query.select(root);  
        Query q = session.createQuery(query);
        return q.getResultList();
    }
    
    @Override
    public User getUserByEmail(String email) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        
        Predicate p = builder.equal(root.get("email"), email.trim());
        query = query.where(p);
        
        query = query.select(root);  
        Query q = session.createQuery(query);
        if(!q.getResultList().isEmpty()) {
            User u = (User)q.getResultList().get(0);
            return u;
        } else {
            return null;
        }
    }

    @Override
    public User getUserById(int id) {
        Session session = this.sessionFactory.getObject().getCurrentSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> query = builder.createQuery(User.class);
        Root root = query.from(User.class);
        
        if(id != 0){
            Predicate p = builder.equal(root.get("id").as(String.class), id);
            query = query.where(p);
        }
        
        query = query.select(root);  
        Query q = session.createQuery(query);
        if(!q.getResultList().isEmpty()) {
            User u = (User)q.getResultList().get(0);
            return u;
        } else {
            return null;
        }
    }
    
    
}
