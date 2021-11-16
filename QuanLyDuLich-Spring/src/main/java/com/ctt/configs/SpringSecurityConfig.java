/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.configs;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.ctt.pojos.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 *
 * @author ADMIN
 */
@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = {
    "com.ctt.repository",
    "com.ctt.service"
})
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserDetailsService userDetailsService;
    
    @Bean
    public BCryptPasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }
    
    
    
    @Bean
    public Cloudinary cloudinary() {
        Cloudinary c = new Cloudinary(ObjectUtils.asMap(
            "cloud_name", "tourapp",
            "api_key", "587358617598231",
            "api_secret", "pjECdbOjqnEftUsF0wBEDJwSF_4",
            "secure", true
        ));
        return c;
    }
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder()); //To change body of generated methods, choose Tools | Templates.
    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {
    http.authorizeRequests()
      .antMatchers("/")
      .permitAll()

      .antMatchers("/admin").access("hasRole('" + Role.ROLE_ADMIN.name() + "')")
      .antMatchers("/admin/profile").access("hasAnyRole('" + Role.ROLE_ADMIN.name() + "','" + Role.ROLE_BUSINESS.name() + Role.ROLE_SALESMAN.name() + "')")
      .antMatchers("/admin/map").access("hasAnyRole('" + Role.ROLE_ADMIN.name() + "','" + Role.ROLE_BUSINESS.name() + Role.ROLE_SALESMAN.name() + "')")
      .antMatchers("/admin/payments/**").access("hasAnyRole('" + Role.ROLE_ADMIN.name() + "','" + Role.ROLE_SALESMAN.name() + "')")
      .antMatchers("/admin/users/**").access("hasAnyRole('" + Role.ROLE_ADMIN.name() + "','" + Role.ROLE_BUSINESS.name() + "')")
      .antMatchers("/admin/packages/**").access("hasAnyRole('" + Role.ROLE_ADMIN.name() + "','" + Role.ROLE_BUSINESS.name() + "')")
      .antMatchers("/admin/blogs/**").access("hasAnyRole('" + Role.ROLE_ADMIN.name() + "','" + Role.ROLE_BUSINESS.name() + "')")
      .antMatchers("/admin/commenttours/**").access("hasAnyRole('" + Role.ROLE_ADMIN.name() + "','" + Role.ROLE_BUSINESS.name() + "')")
      .antMatchers("/admin/commentblogs/**").access("hasAnyRole('" + Role.ROLE_ADMIN.name() + "','" + Role.ROLE_BUSINESS.name() + "')")
            
      .and()
      .formLogin()
      .loginPage("/signin")
        .usernameParameter("username")
        .passwordParameter("password")
      .failureUrl("/signin?error=loginError")
      .defaultSuccessUrl("/")

      .and()
      .logout()
      .logoutSuccessUrl("/signin")

      .and()
      .exceptionHandling()
      .accessDeniedPage("/signin?accessDenied")

      .and()
      .csrf().disable();
    }
}
