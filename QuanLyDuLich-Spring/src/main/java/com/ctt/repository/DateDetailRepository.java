/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository;

import com.ctt.pojos.DateDetail;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface DateDetailRepository {
    DateDetail getDateDetailById(int datedetailId);
    List<DateDetail> getListDateDetailById(int tourId);
    boolean addDateDetail(DateDetail datedetail);
    void removeDateDetail(DateDetail d);
}
