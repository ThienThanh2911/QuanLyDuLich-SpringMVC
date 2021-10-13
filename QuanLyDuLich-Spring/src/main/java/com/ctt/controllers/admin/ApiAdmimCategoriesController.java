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

import com.ctt.pojos.Category;
import com.ctt.service.CategoryService;
import java.text.ParseException;
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
public class ApiAdmimCategoriesController {
    @Autowired
    private CategoryService categoryService;
    @PostMapping(path = "/admin/api/categories/add-category", produces={
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Category> addCategory(@RequestBody Map<String, String> params) throws ParseException{
        Category t = new Category();
        t.setName(params.get("cateName"));
        t = this.categoryService.addCategory(t);
        if(t == null)
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        return new ResponseEntity<>(t,HttpStatus.CREATED);
    }
    @DeleteMapping(path = "/admin/api/categories/remove-category/{cateId}")
    public void removeCategory(@PathVariable("cateId") String cateId){
        this.categoryService.removeCategory(this.categoryService.getCategoryById(Integer.parseInt(cateId)));
    }
}
