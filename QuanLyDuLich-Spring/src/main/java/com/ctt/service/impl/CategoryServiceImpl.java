/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.service.impl;

import com.ctt.pojos.Category;
import com.ctt.repository.CategoryRepository;
import com.ctt.service.CategoryService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Windows-1909
 */
@Service 
public class CategoryServiceImpl implements CategoryService{
    @Autowired
    private CategoryRepository categoryRepository;
    @Override
    public List<Category> getCategories() {
        return this.categoryRepository.getCategories();
    }

    @Override
    public Category getCategoryById(int id) {
        return this.categoryRepository.getCategoryById(id);
    }

    @Override
    public Category addCategory(Category cate) {
        return this.categoryRepository.addCategory(cate);
    }

    @Override
    public void removeCategory(Category cate) {
        this.categoryRepository.removeCategory(cate);
    }
    
    
}
