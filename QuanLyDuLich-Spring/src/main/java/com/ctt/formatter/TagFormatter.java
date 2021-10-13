/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.formatter;

import com.ctt.pojos.Tags;
import com.ctt.pojos.Tours;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author ADMIN
 */
public class TagFormatter implements Formatter<Tags> {
    @Override
    public String print(Tags t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public Tags parse(String string, Locale locale) throws ParseException {
        Tags u = new Tags();
        u.setId(Integer.parseInt(string));
        
        return u;
    }
}
