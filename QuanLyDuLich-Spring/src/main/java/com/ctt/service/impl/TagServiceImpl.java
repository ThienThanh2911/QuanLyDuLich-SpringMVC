/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service.impl;

import com.ctt.pojos.Tags;
import com.ctt.repository.TagRepository;
import com.ctt.service.TagService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Windows-1909
 */
@Service
public class TagServiceImpl implements TagService {
    @Autowired
    private TagRepository tagRepository;
    
    @Override
    public List<Tags> getTags() {
        return this.tagRepository.getTags();
    }

    @Override
    public Tags getTagById(int id) {
        return this.tagRepository.getTagById(id);
    }

    @Override
    public Tags addTag(Tags tag) {
        return this.tagRepository.addTag(tag);
    }    

    @Override
    public void removeTag(Tags tag) {
        this.tagRepository.removeTag(tag);
    }
    
    
}
