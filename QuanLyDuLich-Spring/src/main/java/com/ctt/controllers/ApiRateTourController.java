/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers;

import com.ctt.pojos.RateTour;
import com.ctt.service.RateTourService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ADMIN
 */
@RestController
public class ApiRateTourController {
    @Autowired
    private RateTourService rateTourService;

    @PostMapping(path = "/api/set-rate-tour")
    public void setRateTour(@RequestParam(required = false) Map<String, String> params){
        this.rateTourService.setRateTour(Integer.parseInt(params.get("rate")), Integer.parseInt(params.get("userId")), Integer.parseInt(params.get("tourId")));
    }
}
