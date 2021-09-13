/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository.impl;

import com.ctt.pojos.Province;
import com.ctt.repository.ProvinceRepository;
import java.util.List;
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
public class ProvinceRepositoryImpl implements ProvinceRepository{
    @Autowired
    private LocalSessionFactoryBean sessionFactory;    
    
    @Override
    @Transactional
    public List<Province> getProvinces() {
        Session s = sessionFactory.getObject().getCurrentSession();
        Query q = s.createQuery("From Province");
        return q.getResultList();
    }
}
