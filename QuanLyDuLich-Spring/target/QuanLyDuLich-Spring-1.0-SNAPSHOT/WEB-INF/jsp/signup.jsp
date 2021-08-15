<%-- 
    Document   : signup
    Created on : Aug 12, 2021, 9:34:45 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/signup.css">

<div class="container">
        <div class="card h-100">
                <div class="card-body">
                        <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <h6 class="mb-3 text-primary">Personal Details</h6>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="fullName">Full Name</label>
                                                <input type="text" class="form-control" id="fullName" placeholder="Enter your full name">
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="eMail">Email</label>
                                                <input type="email" class="form-control" id="eMail" placeholder="Enter your email">
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="phone">Phone</label>
                                                <input type="text" class="form-control" id="phone" placeholder="Enter your phone number">
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="birth">Date Of Birth</label>
                                                <input type="text" class="form-control" id="birth" placeholder="Enter your birth day">
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group" >
                                                <label for="phone">Gender</label>
                                                <form>
                                                    <select name="cars" class="custom-select" style="background: var(--input-color); border: 1px solid  var(--border-color); font-size: .825rem; color: var(--inputtext-color)">
                                                      <option selected>What is your gender?</option>
                                                      <option value="male">Male</option>
                                                      <option value="female">Female</option>
                                                    </select>
                                                </form>
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="about">About You</label>
                                            <input type="text" class="form-control" id="about" placeholder="Enter your infomation">
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
                                                <input type="password" class="form-control" id="password" placeholder="Enter your password">
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="confirmPassword">Confirm Password</label>
                                                <input type="password" class="form-control" id="confirmPassword" placeholder="Enter your password again">
                                        </div>
                                </div>
                        </div><br>
                        <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="text-right">
                                                <button type="button" id="submit" name="submit" class="btn btn-secondary">Cancel</button>
                                                <button type="button" id="submit" name="submit" class="btn btn-primary">Sign Up</button>
                                        </div>
                                </div>
                        </div>
            </div>
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