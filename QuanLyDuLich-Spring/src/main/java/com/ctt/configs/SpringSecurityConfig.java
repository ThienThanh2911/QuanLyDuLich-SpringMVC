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
import org.springframework.core.annotation.Order;
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
public class SpringSecurityConfig{
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
    @Configuration
    @Order(2)
    public class UserSpringSecurityConfiguration extends WebSecurityConfigurerAdapter {
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
          .accessDeniedPage("/403")
          
          .and()
          .csrf().disable();
        }
    }
    @Configuration
    @Order(1)
    public class AdminSpringSecurityConfiguration extends WebSecurityConfigurerAdapter {
        @Override
        protected void configure(AuthenticationManagerBuilder auth) throws Exception {
            auth.userDetailsService(userDetailsService)
                    .passwordEncoder(passwordEncoder()); //To change body of generated methods, choose Tools | Templates.
        }
        @Override
        protected void configure(HttpSecurity http) throws Exception {
        http.antMatcher("/admin*")
          .authorizeRequests()
          .anyRequest()
          .hasRole(Role.ADMIN.name())
          
          .and()
          .formLogin()
          .loginPage("/admin/signin")
           .usernameParameter("username")
           .passwordParameter("password")
          .failureUrl("/admin/signin?error=loginError")
          .defaultSuccessUrl("/admin")
          
          .and()
          .logout()
          .logoutSuccessUrl("/admin/signin")
          
          .and()
          .exceptionHandling()
          .accessDeniedPage("/403")
          
          .and()
          .csrf().disable();
        }

    }
}