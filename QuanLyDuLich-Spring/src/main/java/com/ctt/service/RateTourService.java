/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service;

import com.ctt.pojos.RateTour;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface RateTourService {
    void setRateTour(int rate, int userId, int tourId);
    int getRateTour(int userId, int tourId);
    List<RateTour> getListRateTour(int tourId);
}
