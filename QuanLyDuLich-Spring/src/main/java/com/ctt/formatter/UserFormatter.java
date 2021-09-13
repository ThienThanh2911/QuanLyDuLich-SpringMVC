/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.formatter;

import com.ctt.pojos.Category;
import com.ctt.pojos.User;
import java.text.ParseException;
import java.util.Locale;
import org.springframework.format.Formatter;

/**
 *
 * @author ADMIN
 */
public class UserFormatter implements Formatter<User> {
    @Override
    public String print(User t, Locale locale) {
        return String.valueOf(t.getId());
    }

    @Override
    public User parse(String string, Locale locale) throws ParseException {
        User u = new User();
        u.setId(Integer.parseInt(string));
        
        return u;
    }
}
