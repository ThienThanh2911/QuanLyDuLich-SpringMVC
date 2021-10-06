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


import com.ctt.pojos.Tours;
import org.springframework.stereotype.Controller;

import org.springframework.beans.factory.annotation.Autowired;

import com.ctt.service.TourService;
import java.util.Map;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
@Controller
public class ApiAdminPackagesController {
    @Autowired
    private TourService tourService;
    
    @PostMapping(path = "/admin/api/packages/set-active-tour", produces={
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Tours> setActiveTour(@RequestBody Map<String, String> params){
        Tours c = this.tourService.getTourById(Integer.parseInt(params.get("tourId")));
        c.setActive(!c.isActive());
        if(!this.tourService.addOrUpdate(c))
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        return new ResponseEntity<>(HttpStatus.OK);
    }
    
    @DeleteMapping(path = "/admin/api/packages/remove-tour/{tourId}")
    public void removeTour(@PathVariable("tourId") String tourId){
        this.tourService.removeTour(this.tourService.getTourById(Integer.parseInt(tourId)));
    }
}
