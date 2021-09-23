package com.ctt.validator;

import com.ctt.repository.UserRepository;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;


public class UserEmailValidator implements ConstraintValidator<UserEmail, String> {
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public void initialize(UserEmail constraintAnnotation) {
	}

	@Override
	public boolean isValid(String email, ConstraintValidatorContext context) {
            if(userRepository == null) {
                    return true;
            }
            return userRepository.getUserByEmail(email) == null;
	}
}