/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.repository;

import com.ctt.pojos.Category;
import java.util.List;

/**
 *
 * @author Windows-1909
 */
public interface CategoryRepository {
    List<Category> getCategories();
    Category getCategoryById(int id);
    Category addCategory(Category cate);
    void removeCategory(Category cate);
}
