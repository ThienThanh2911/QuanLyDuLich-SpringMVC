/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ctt.pojos.Tours;
import com.ctt.repository.TourRepository;
import com.ctt.service.TourService;
import java.io.IOException;
import java.util.List;
import java.util.Map;
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
    @Autowired
    private Cloudinary cloudinary;
    
    @Override
    public List<Tours> getTours(String kw, int page) {
        return this.tourRepository.getTours(kw, page);
    }

    @Override
    public boolean addOrUpdate(Tours tours) {
        try {
            Map r = this.cloudinary.uploader().upload(tours.getFile().getBytes(), 
                ObjectUtils.asMap("resource_type", "auto"));
            tours.setPhotos((String) r.get("secure_url"));
            
            return this.tourRepository.addOrUpdate(tours);
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public long countTours() {
        return this.tourRepository.countTours();
    }
}
