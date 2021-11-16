/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ctt.pojos.DateDetail;
import com.ctt.pojos.Status;
import com.ctt.pojos.Tours;
import com.ctt.repository.TourRepository;
import com.ctt.service.CategoryService;
import com.ctt.service.DateDetailService;
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
    private CategoryService categoryService;
    @Autowired
    private DateDetailService dateDetailService;
    @Autowired
    private Cloudinary cloudinary;

    @Override
    public Tours getTourById(int id) {
        return this.tourRepository.getTourById(id);
    }
    
    @Override
    public List<Tours> getTours(String kw, String cate, String date, String priceMin, String priceMax, boolean isActive, int page) {
        return this.tourRepository.getTours(kw, cate, date, priceMin, priceMax, isActive, page);
    }

    @Override
    public List<Tours> getToursNew() {
        return this.tourRepository.getToursNew();
    }
    
    @Override
    @Transactional
    public boolean addOrUpdate(Tours tours) {
        boolean a = tours.isActive();
        MultipartFile img = tours.getFile();
        if(!this.tourRepository.getTours(tours.getName(), null, null, null, null, false, 1).isEmpty()){
            Tours rootTour = this.tourRepository.getTours(tours.getName(), null, null, null, null, false, 1).get(0);
            tours.setId(rootTour.getId());
            if(tours.getTags().isEmpty())
                tours.setTags(rootTour.getTags());
        }else{
            a = true;
        }
        try {
            if (img != null && !img.isEmpty()) {
                Map r = this.cloudinary.uploader().upload(tours.getFile().getBytes(), 
                    ObjectUtils.asMap("resource_type", "auto"));
                tours.setPhotos((String) r.get("secure_url"));
            }
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
        tours.setActive(a);
        if(this.tourRepository.addOrUpdate(tours)){
            if(tours.getStartDate() != null && tours.getFinishDate() != null){
                Tours t = this.tourRepository.getTours(tours.getName(), null, null, null, null, false, 1).get(0);
                DateDetail d = new DateDetail();
                d.setStartDate(tours.getStartDate());
                d.setFinishDate(tours.getFinishDate());
                d.setTour(t);
                d.setStatus(Status.ACTIVE);
                this.dateDetailService.addDateDetail(d);
                String cate = this.categoryService.getCategoryById(tours.getCategory().getId()).getCode();
                t.setCode("TO" + cate + t.getId());
                this.tourRepository.addOrUpdate(t);
            }
            return true;
        }else return false;
    }

    @Override
    public void removeTour(Tours tours) {
        this.tourRepository.removeTour(tours);
    }

    @Override
    public List<Tours> getToursFeatured() {
        return this.tourRepository.getToursFeatured();
    }
    
    @Override
    public long countTours() {
        return this.tourRepository.countTours();
    }
}
