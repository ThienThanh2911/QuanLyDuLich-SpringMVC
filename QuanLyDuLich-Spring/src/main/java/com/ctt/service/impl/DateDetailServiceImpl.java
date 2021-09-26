/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service.impl;

import com.ctt.pojos.DateDetail;
import com.ctt.repository.DateDetailRepository;
import com.ctt.service.DateDetailService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class DateDetailServiceImpl implements DateDetailService {
    @Autowired
    private DateDetailRepository dateDetailRepository;

    @Override
    public List<DateDetail> getListDateDetailById(int tourId) {
        return this.dateDetailRepository.getListDateDetailById(tourId);
    }
    
    
}
