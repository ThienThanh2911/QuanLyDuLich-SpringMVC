/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service.impl;

import com.ctt.pojos.RateTour;
import com.ctt.repository.RateTourRepository;
import com.ctt.repository.TourRepository;
import com.ctt.repository.UserRepository;
import com.ctt.service.RateTourService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class RateTourServiceImpl implements RateTourService{
    @Autowired
    private RateTourRepository rateTourRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private TourRepository tourRepository;
    
    @Override
    public int getRateTour(int userId, int tourId) {
        return this.rateTourRepository.getRateTour(userId, tourId);
    }

    @Override
    public void setRateTour(int rate, int userId, int tourId) {
        RateTour ra = null;
        for(RateTour rb : this.rateTourRepository.getListRateTour(tourId)){
            if(rb.getUser().getId() == userId){
                ra = rb;
                break;
            }
        }
        if(ra == null){
            RateTour r = new RateTour();
            r.setRate(rate);
            r.setUser(this.userRepository.getUserById(userId));
            r.setTour(this.tourRepository.getTourById(tourId));
            this.rateTourRepository.setRateTour(r);
        }else{
            ra.setRate(rate);
            this.rateTourRepository.setRateTour(ra);
        }
        
    }

    @Override
    public List<RateTour> getListRateTour(int tourId) {
        return this.rateTourRepository.getListRateTour(tourId);
    }
    
    
}
