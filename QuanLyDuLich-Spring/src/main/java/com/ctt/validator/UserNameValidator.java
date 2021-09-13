package com.ctt.validator;

import com.ctt.repository.UserRepository;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;


public class UserNameValidator implements ConstraintValidator<UserName, String> {
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public void initialize(UserName constraintAnnotation) {
	}

	@Override
	public boolean isValid(String username, ConstraintValidatorContext context) {
            if(userRepository == null) {
                    return true;
            }
            return userRepository.getUsers(username) == null;
	}
}