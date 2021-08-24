<%-- 
    Document   : signup
    Created on : Aug 12, 2021, 9:34:45 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="resources/css/signup.css">

<div class="container">
        <div class="card h-100">
            <c:url value="/signup" var="action"/>
            <form:form method="post" action="${action}" modelAttribute="user">
                <div class="card-body">
                        <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <h6 class="mb-3 text-primary">Personal Details</h6>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="firstName">First Name</label>
                                                <form:input path="firstName" class="form-control" id="firstName" placeholder="Enter your first name"/>
                                                <form:errors path="firstName" element="div" cssClass="alert alert-danger" />
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="lastName">Last Name</label>
                                                <form:input path="lastName" class="form-control" id="lastName" placeholder="Enter your last name"/>
                                                <form:errors path="lastName" element="div" cssClass="alert alert-danger" />
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="username">Username</label>
                                                <form:input path="username" class="form-control" id="username" placeholder="Enter your username"/>
                                                <form:errors path="username" element="div" cssClass="alert alert-danger" />
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="email">Email</label>
                                                <form:input path="email" class="form-control" id="email" placeholder="Enter your email"/>
                                                <form:errors path="email" element="div" cssClass="alert alert-danger" />
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="phone">Phone</label>
                                                <form:input path="phone" class="form-control" id="phone" placeholder="Enter your phone number"/>
                                                <form:errors path="phone" element="div" cssClass="alert alert-danger" />
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="birth">Date Of Birth</label>
                                                <form:input path="birth" class="form-control" id="birth" placeholder="Enter your birth day"/>
                                                <form:errors path="birth" element="div" cssClass="alert alert-danger" />
                                        </div>  
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group" >
                                                <label for="gender">Gender</label>
                                                <form:select path="gender" name="cars" class="custom-select" style="background: var(--input-color); border: 1px solid  var(--border-color); font-size: .825rem; color: var(--inputtext-color)">
                                                    <form:option value="">What is your gender?</form:option>
                                                    <form:option value="male">Male</form:option>
                                                    <form:option value="female">Female</form:option>
                                                </form:select>
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="about">About You</label>
                                            <form:textarea path="about" class="form-control" id="about" placeholder="Enter your infomation"/>
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="street">Street</label>
                                                <form:input path="street" class="form-control" id="street" placeholder="Enter your street"/>
                                                <form:errors path="street" element="div" cssClass="alert alert-danger" />
                                        </div>  
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="city">City</label>
                                                <form:input path="city" class="form-control" id="city" placeholder="Enter your city"/>
                                                <form:errors path="city" element="div" cssClass="alert alert-danger" />
                                        </div>  
                                </div>
                        </div>
                        <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <h6 class="mb-3 text-primary">Your Password</h6>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="password">Password</label>
                                                <form:password path="password" class="form-control" id="password" placeholder="Enter your password"/>
                                                <form:errors path="password" element="div" cssClass="alert alert-danger" />
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">                                                <label for="password">Password</label>
                                                <label for="confirm_password">Password</label>
                                                <form:password path="confirmPassword" class="form-control" id="confirm_password" placeholder="Enter your password"/>
                                                <form:errors path="confirmPassword" element="div" cssClass="alert alert-danger" />
                                        </div>
                                </div>
                        </div><br>
                        <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="text-right">
                                                <!--<button type="button" id="submit" name="submit" class="btn btn-secondary">Cancel</button>-->
                                                <input value="Sign Up" type="submit" id="submit" name="submit" class="btn btn-primary"/>
                                        </div>
                                </div>
                        </div>
                </div>
            </form:form>
    </div>
</div>
<footer style="margin-top: 20%;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p style="color: var(--text-color)">
                        Copyright © 2021 TWIN TOUR
                        - Developed by <a href="#">Thành Tựu</a>
                    </p>
                </div>
            </div>
        </div>
</footer>