/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service;

import com.ctt.pojos.Tours;
import java.util.List;

/**
 *
 * @author Windows-1909
 */
public interface TourService {
    List<Tours> getTours(String kw, String cate, String date, String priceMin, String priceMax, int page);
    long countTours();
    boolean addOrUpdate(Tours tours);
    List<Tours> getTourById(String id);
}
