/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.converter;

import com.ctt.pojos.Tags;
import com.ctt.repository.TagRepository;
import org.springframework.core.convert.converter.Converter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 *
 * @author ADMIN
 */
@Component
public class StringToTagConverter implements Converter<String, Tags> {

  @Autowired
  private TagRepository tagRepository;

  @Override
  public Tags convert(final String source) {
    return tagRepository.getTagById(Integer.parseInt(source));
  }
}