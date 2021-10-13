/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service;

import com.ctt.pojos.Tags;
import java.util.List;

/**
 *
 * @author Windows-1909
 */
public interface TagService {
    List<Tags> getTags();
    Tags getTagById(int id);
    Tags addTag(Tags tag);
    void removeTag(Tags tag);
}
