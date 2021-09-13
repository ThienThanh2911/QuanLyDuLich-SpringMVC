/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.formatter;

import com.ctt.pojos.Tours;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author ADMIN
 */
public class TourFormatter implements Formatter<Tours> {
    @Override
    public String print(Tours t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public Tours parse(String string, Locale locale) throws ParseException {
        Tours u = new Tours();
        u.setId(Integer.parseInt(string));
        
        return u;
    }
}
