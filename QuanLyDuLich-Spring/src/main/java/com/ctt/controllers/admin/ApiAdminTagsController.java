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

import com.ctt.pojos.Tags;
import com.ctt.service.TagService;
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
public class ApiAdminTagsController {
    @Autowired
    private TagService tagService;
    @PostMapping(path = "/admin/api/tags/add-tag", produces={
        MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Tags> addTag(@RequestBody Map<String, String> params) throws ParseException{
        Tags t = new Tags();
        t.setName(params.get("tagName"));
        t = this.tagService.addTag(t);
        if(t == null)
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        return new ResponseEntity<>(t,HttpStatus.CREATED);
    }
    @DeleteMapping(path = "/admin/api/tags/remove-tag/{tagId}")
    public void removeTag(@PathVariable("tagId") String tagId){
        this.tagService.removeTag(this.tagService.getTagById(Integer.parseInt(tagId)));
    }
}
