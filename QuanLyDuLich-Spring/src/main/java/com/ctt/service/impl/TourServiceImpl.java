/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service.impl;

import com.ctt.pojos.Tours;
import com.ctt.repository.TourRepository;
import com.ctt.service.TourService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 *
 * @author Windows-1909
 */
@Service
public class TourServiceImpl implements TourService {
    @Autowired
    private TourRepository tourRepository;
    
    @Override
    public List<Tours> getTours(String kw) {
        return this.tourRepository.getTours(kw);
    }
}
