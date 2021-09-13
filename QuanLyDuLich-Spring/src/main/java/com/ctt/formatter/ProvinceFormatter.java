/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.formatter;

import com.ctt.pojos.Province;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author ADMIN
 */
public class ProvinceFormatter implements Formatter<Province> {
    @Override
    public String print(Province t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public Province parse(String string, Locale locale) throws ParseException {
        Province u = new Province();
        u.setId(Integer.parseInt(string));
        
        return u;
    }
}
