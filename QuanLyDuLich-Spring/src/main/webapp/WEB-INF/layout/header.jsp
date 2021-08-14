<%-- 
    Document   : header
    Created on : Aug 6, 2021, 3:59:51 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <c:url value="/" var="home" />
                        <a href="${home}" class="logo">TWIN<em> TOUR</em></a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <c:url value="/" var="home" />
                            <li><a href="${home}" class="active">Home</a></li>
                            <li><a href="packages">Packages</a></li>
                            <li><a href="blog">Blog</a></li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">About</a>
                              
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="about">About Us</a>
                                    <a class="dropdown-item" href="testimonials">Testimonials</a>
                                    <a class="dropdown-item" href="terms">Terms</a>
                                </div>
                            </li>
                            <li><a href="contact">Contact</a></li> 
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Account</a>
                              
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="your-profile">Your profile</a>
                                    <a class="dropdown-item" href="change-password">Change password</a>
                                    <a class="dropdown-item" href="terms">Log out</a>
                                </div>
                            </li>
                        </ul>        
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ***** Header Area End ***** -->