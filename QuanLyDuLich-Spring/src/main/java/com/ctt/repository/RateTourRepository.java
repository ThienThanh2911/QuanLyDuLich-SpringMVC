/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository;

import com.ctt.pojos.RateTour;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface RateTourRepository {
    void setRateTour(RateTour r);
    int getRateTour(int userId, int tourId);
    List<RateTour> getListRateTour(int tourId);
}
