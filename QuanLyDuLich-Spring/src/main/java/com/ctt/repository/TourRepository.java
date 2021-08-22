/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository;

import com.ctt.pojos.Tours;
import java.util.List;

/**
 *
 * @author Windows-1909
 */
public interface TourRepository {
    List<Tours> getTours(String kw, int page);
    long countTours();
    boolean addOrUpdate(Tours tours);
}
