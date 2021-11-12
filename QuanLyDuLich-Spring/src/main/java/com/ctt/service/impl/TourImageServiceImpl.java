/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service.impl;

import com.ctt.pojos.TourImage;
import com.ctt.repository.TourImageRepository;
import com.ctt.service.TourImageService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Windows-1909
 */
@Service
public class TourImageServiceImpl implements TourImageService {
    @Autowired
    private TourImageRepository tourImageRepository;
    @Override
    public List<TourImage> getTourImageById(int id) {
        return this.tourImageRepository.getTourImageById(id);
    }
    
}
