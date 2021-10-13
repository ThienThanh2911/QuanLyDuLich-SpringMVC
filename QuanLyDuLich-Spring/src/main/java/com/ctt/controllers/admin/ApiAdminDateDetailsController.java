/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers.admin;

/**
 *
 * @author ADMIN
 */

import com.ctt.pojos.DateDetail;
import com.ctt.pojos.Status;
import com.ctt.service.DateDetailService;
import com.ctt.service.TourService;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Map;
import org.springframework.stereotype.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
@Controller
public class ApiAdminDateDetailsController {
    @Autowired
    private DateDetailService dateDetailService;
    @Autowired
    private TourService tourService;
    @PostMapping(path = "/admin/api/datedetails/add-datedetail", produces={
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<DateDetail> addDateDetail(@RequestBody Map<String, String> params) throws ParseException{
        DateDetail d = new DateDetail();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");   
        dateFormat.setLenient(false);
        d.setStartDate(dateFormat.parse(params.get("startDate")));
        d.setFinishDate(dateFormat.parse(params.get("finishDate")));
        d.setStatus(Status.ACTIVE);
        d.setTour(this.tourService.getTourById(Integer.parseInt(params.get("tourId"))));
        boolean c = this.dateDetailService.addDateDetail(d);
        if(!c)
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        return new ResponseEntity<>(this.dateDetailService.getDateDetailById(d.getId()),HttpStatus.CREATED);
    }
    @DeleteMapping(path = "/admin/api/datedetails/remove-datedetail/{dateId}")
    public void removeDate(@PathVariable("dateId") String dateId){
        this.dateDetailService.removeDateDetail(this.dateDetailService.getDateDetailById(Integer.parseInt(dateId)));
    }
}
