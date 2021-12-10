/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ctt.common;

/**
 *
 * @author cttha
 */
import com.ctt.pojos.Role;
import com.ctt.pojos.User;
import com.ctt.service.ProvinceService;
import com.ctt.service.UserService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;

@Component
public class GoogleUtils {
  @Autowired
    private UserService userDetailsService;
  @Autowired
    private ProvinceService provinceService;
  public static String GOOGLE_CLIENT_ID = "282559155698-m5vjui8150iamdmm8d7dk7gdugp6in8l.apps.googleusercontent.com";
  public static String GOOGLE_CLIENT_SECRET = "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";
  public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/QuanLyDuLich-Spring/signin-google";
  public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
  public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
  public static String GOOGLE_GRANT_TYPE = "authorization_code";
  public String getToken(final String code) throws ClientProtocolException, IOException {
    String response = Request.Post(GOOGLE_LINK_GET_TOKEN)
        .bodyForm(Form.form().add("client_id", GOOGLE_CLIENT_ID)
            .add("client_secret", GOOGLE_CLIENT_SECRET)
            .add("redirect_uri", GOOGLE_REDIRECT_URI).add("code", code)
            .add("grant_type", GOOGLE_GRANT_TYPE).build())
        .execute().returnContent().asString();
    ObjectMapper mapper = new ObjectMapper();
    JsonNode node = mapper.readTree(response).get("access_token");
    return node.textValue();
  }
  public GooglePojo getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
    String link = GOOGLE_LINK_GET_USER_INFO + accessToken;
    String response = Request.Get(link).execute().returnContent().asString();
    ObjectMapper mapper = new ObjectMapper();
    GooglePojo googlePojo = mapper.readValue(response, GooglePojo.class);
    return googlePojo;
  }
  public UserDetails buildUser(GooglePojo googlePojo) {
    boolean enabled = true;
    boolean accountNonExpired = true;
    boolean credentialsNonExpired = true;
    boolean accountNonLocked = true;
    List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
    authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
    User user = this.userDetailsService.getUserByEmail(googlePojo.getEmail());
    if(user == null){
        user = new User();
        user.setAbout("null");
        user.setActive(true);
        user.setAvatar(googlePojo.getPicture());
        user.setBirth(new Date());
        user.setEmail(googlePojo.getEmail());
        user.setUsername(googlePojo.getEmail());
        user.setFirstName("null");
        user.setLastName("null");
        user.setGender("null");
        user.setPhone("1234567890");
        user.setStreet("null");
        user.setPassword("googleLogin");
        user.setRole(Role.ROLE_USER);
        user.setProvince(provinceService.getProvinces().get(0));
        this.userDetailsService.addOrUpdateUser(user);
    }
    UserDetails userDetail = new org.springframework.security.core.userdetails.User(googlePojo.getEmail(),
        "", enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
    return userDetail;
  }
}
