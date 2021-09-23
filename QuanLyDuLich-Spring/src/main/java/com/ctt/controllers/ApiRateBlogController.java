/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.controllers;

import com.ctt.service.RateBlogService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author ADMIN
 */
@RestController
public class ApiRateBlogController {
    @Autowired
    private RateBlogService rateBlogService;

    @PostMapping(path = "/api/set-rate-blog")
    public void setRateBlog(@RequestParam(required = false) Map<String, String> params){
        this.rateBlogService.setRateBlog(Integer.parseInt(params.get("rate")), Integer.parseInt(params.get("userId")), Integer.parseInt(params.get("blogId")));
    }
}
