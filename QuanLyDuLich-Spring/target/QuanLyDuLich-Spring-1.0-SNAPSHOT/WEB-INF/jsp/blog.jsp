<%-- 
    Document   : blog
    Created on : Aug 15, 2021, 9:51:29 AM
    Author     : Windows-1909
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<section class="section section-bg" id="call-to-action" style="background-image: url(images/banner-image-1-1920x500.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="cta-content">
                        <br>
                        <br>
                        <h2>Read our <em>Blog</em></h2>
                        <p>Danh sách các bài viết</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ***** Blog Start ***** -->
    <section class="section" id="our-classes">
        <div class="container">
            <br>
            <br>
            <div class="row">
                <div class="col-lg-8">
                    <section class='tabs-content'>
                        <c:forEach var="blog" items="${blogs}">
                            <article>
                            <img src="images/blog-image-1-940x460.jpg" alt="">
                            <h4>${blog.title}</h4>

                            <p><i class="fa fa-user"></i> ${blog.user.username} &nbsp;|&nbsp; <i class="fa fa-calendar"></i> ${blog.createdDate} &nbsp;|&nbsp; <i class="fa fa-comments"></i>  15 comments</p>

                            <div class="main-button">
                                <a href="blog-details/${blog.id}">Continue Reading</a>
                            </div>
                          </article>

                          <br>
                          <br>
                        </c:forEach>
                    </section>
                </div>

                <div class="col-lg-4">
                    <h5 class="h5" style="color: var(--text-color)">Search</h5>
                    
                    <div class="contact-form">
                        <form id="search_form" name="gs" method="GET" action="#">
                          <input type="text" name="q" class="searchText" placeholder="type to search..." autocomplete="on">
                        </form>
                    </div>

                    <h5 class="h5" style="color: var(--text-color)">Recent posts</h5>

                    <ul>
                        <li>
                            <p><a href="blog-details">Blog số 1</a></p>
                            <small style="color: var(--text-color)"><i class="fa fa-user"></i> Thành &nbsp;|&nbsp; <i class="fa fa-calendar"></i> 15.08.2021 10:10</small>
                        </li>

                        <li><br></li>

                        <li>
                            <p><a href="blog-details">Blog số 2</a></p>
                            <small style="color: var(--text-color)"><i class="fa fa-user"></i> Thành &nbsp;|&nbsp; <i class="fa fa-calendar"></i> 15.08.2021 10:10</small>
                        </li>

                        <li><br></li>

                        <li>
                          <p><a href="blog-details">Blog số 3</a></p>

                          <small style="color: var(--text-color)"><i class="fa fa-user"></i> Thành &nbsp;|&nbsp; <i class="fa fa-calendar"></i> 15.08.2021 10:10</small>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Blog End ***** -->