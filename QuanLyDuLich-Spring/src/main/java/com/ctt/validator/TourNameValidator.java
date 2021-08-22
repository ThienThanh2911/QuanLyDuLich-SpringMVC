/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.validator;

import com.ctt.pojos.Tours;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

/**
 *
 * @author Windows-1909
 */
@Component
public class TourNameValidator implements Validator {

    @Override
    public boolean supports(Class<?> type) {
        return Tours.class.isAssignableFrom(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Tours t = (Tours) o;
        if (!t.getName().contains("test"))
            errors.rejectValue("name", "tour.name.err");
    }
}
