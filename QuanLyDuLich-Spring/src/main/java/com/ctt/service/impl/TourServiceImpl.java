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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


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
    public List<Tours> getTourById(String id) {
        return this.tourRepository.getTourById(id);
    }
    
    @Override
    public List<Tours> getTours(String kw, String cate, String date, String priceMin, String priceMax, int page) {
        return this.tourRepository.getTours(kw, cate, date, priceMin, priceMax, page);
    }

    @Override
    @Transactional
    public boolean addOrUpdate(Tours tours) {
        MultipartFile img = tours.getFile();
        if (img != null && !img.isEmpty()) {
            try {
                if(!this.tourRepository.getTours(tours.getName(), null, null, null, null, 1).isEmpty())
                    tours.setId(this.tourRepository.getTours(tours.getName(), null, null, null, null, 1).get(0).getId());

                Map r = this.cloudinary.uploader().upload(tours.getFile().getBytes(), 
                    ObjectUtils.asMap("resource_type", "auto"));
                tours.setPhotos((String) r.get("secure_url"));
                return this.tourRepository.addOrUpdate(tours);
            } catch (IOException ex) {
                System.out.println(ex.getMessage());
            }
        }
        return false;
    }

    @Override
    public long countTours() {
        return this.tourRepository.countTours();
    }
}
