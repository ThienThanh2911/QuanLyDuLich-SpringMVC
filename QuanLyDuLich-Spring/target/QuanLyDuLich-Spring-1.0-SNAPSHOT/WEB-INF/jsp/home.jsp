<%-- 
    Document   : home
    Created on : Aug 9, 2021, 4:20:56 PM
    Author     : Windows-1909
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <!-- ***** Main Banner Area Start ***** -->
    <div class="main-banner" id="top">
        <video autoplay muted loop id="bg-video">
            <source src="images/video.mp4" type="video/mp4" />
        </video>

        <div class="video-overlay header-text">
            <div class="caption">
                <h6>Welcome to our website</h6>
                <h2><em>Explore</em> the world with us!</h2>
                <div class="main-button">
                    <a href="contact">Contact Us</a>
                </div>
            </div>
        </div>
    </div>
    <!-- ***** Main Banner Area End ***** -->

   <!-- ***** Cars Starts ***** -->
    <section class="section" id="trainers">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="section-heading">
                        <h2>New <em>Packages</em></h2>
                        <img src="images/line-dec.png" alt="">
                        <p>Danh sách các chuyến đi mới nhất</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <c:forEach var="t" items="${toursNew}">
                <div class="col-lg-4">
                    <div class="trainer-item">
                        <div class="ribbon-wrapper">
                            <div class="ribbon">NEW</div>
                        </div>
                        <div class="image-thumb">
                            <img src="<c:url value="${t.photos}" />" alt="${t.name}">
                        </div>
                        <div class="down-content">
                            <div>
                                <span>${t.price}<sup>đ</sup></span>
                                
                                <span style="float:right">Lượt xem: 100</span>
                            </div>
                            <h4>${t.name}</h4>
                                
                            <p>
                                <i class="fa fa-cube"></i> 20 nights &nbsp;&nbsp;&nbsp;

                                <i class="fa fa-plane"></i> ${t.vehicle.toString()} &nbsp;&nbsp;&nbsp;
                                <c:set var="total" value="${0}" />
                                <c:forEach var="r" items="${t.ratetour}">
                                  <c:set var="total" value="${total + r.rate}" />
                                </c:forEach>
                                <c:if test="${total != 0}">
                                    <i class="fa fa-star"></i> ${total/t.ratetour.size()} &nbsp;&nbsp;&nbsp;
                                </c:if>
                                <c:forEach var="tag" items="${t.tags}">
                                    <div class="badge badge-pill badge-secondary" style="color:white; margin-right: 5px;">${tag.name}</div>
                                </c:forEach>
                            </p>

                            <ul class="social-icons">
                                <li><a href="<c:url value="package-details/${t.id}" />">+ View Package</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="section-heading">
                        <h2>Featured <em>Packages</em></h2>
                        <img src="images/line-dec.png" alt="">
                        <p>Danh sách các chuyến đi nổi bật nhất</p>
                    </div>
                </div>
                <c:forEach var="t" items="${toursFeatured}">
                <div class="col-lg-4">
                    <div class="trainer-item">
                        <div class="ribbon-wrapper">
                            <div class="ribbon">HOT</div>
                        </div>
                        <div class="image-thumb">
                            <img src="<c:url value="${t[2]}" />" alt="${t[1]}">
                        </div>
                        <div class="down-content">
                            <div>
                                <span>${t[4]}<sup>đ</sup></span>
                                
                                <span style="float:right">Lượt xem: 100</span>
                            </div>
                            <h4>${t[1]}</h4>
                                
                            <p>
                                <i class="fa fa-cube"></i> 20 nights &nbsp;&nbsp;&nbsp;

                                <i class="fa fa-plane"></i> ${t[3].toString()} &nbsp;&nbsp;&nbsp;
                                
                                <span class="badge badge-pill badge-success" style="color:white"><i class="fa fa-star"></i> Đánh giá cao</span></span>
                            </p>

                            <ul class="social-icons">
                                <li><a href="<c:url value="package-details/${t[0]}" />">+ View Package</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>

            <br>

            <div class="main-button text-center">
                <a href="packages">View Packages</a>
            </div>
        </div>
    </section>
    <!-- ***** Cars Ends ***** -->

    <section class="section section-bg" id="schedule" style="background-image: url(images/about-fullscreen-1-1920x700.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="section-heading dark-bg">
                        <h2>Read <em>About Us</em></h2>
                        <img src="images/line-dec.png" alt="">
                        <p>Website quản lý du lịch IT82 - Thầy Dương Hữu Thành</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="cta-content text-center">
                        <p>Châu Thiên Thành - 1851050130</p>

                        <p>Châu Thiên Tựu - 1851050179</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ***** Blog Start ***** -->
    <section class="section" id="our-classes">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="section-heading">
                        <h2>Read our <em>Blog</em></h2>
                        <img src="images/line-dec.png" alt="">
                        <p>Danh sách các Blog</p>
                    </div>
                </div>
            </div>
            <div class="row" id="tabs">
              <div class="col-lg-4">
                <ul>
                    <c:forEach var="b" items="${blogsNew}">
                        <li><a href='#${b.id}'>${b.title}</a></li>
                    </c:forEach>
                  <div class="main-rounded-button"><a href="<c:url value="blog" />">Read More</a></div>
                </ul>
              </div>
              <div class="col-lg-8">
                <section class='tabs-content'>
                    <c:forEach var="b" items="${blogsNew}">
                        <article id='${b.id}'>
                            <img src="${b.photos}" alt="">
                            <h4>${b.title}</h4>

                            <p><i class="fa fa-user"></i> ${b.user.username} &nbsp;|&nbsp; <i class="fa fa-calendar"></i> ${b.createdDate} &nbsp;|&nbsp; <i class="fa fa-comments"></i>  ${b.commentblog.size()} comments</p>

                            <div class="main-button">
                                <a href="<c:url value="blog-details/${b.id}" />">Continue Reading</a>
                            </div>
                        </article>
                    </c:forEach>
                </section>
              </div>
            </div>
        </div>
    </section>
    <!-- ***** Blog End ***** -->

    <!-- ***** Call to Action Start ***** -->
    <section class="section section-bg" id="call-to-action" style="background-image: url(images/banner-image-1-1920x500.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="cta-content">
                        <h2>Send us a <em>message</em></h2>
                        <p>Liên hệ hỗ trợ</p>
                        <div class="main-button">
                            <a href="contact">Contact us</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Call to Action End ***** -->

    <!-- ***** Membership Item Start ***** -->
    <section class="section" id="features">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="section-heading">
                        <h2>Read our <em>Membership</em></h2>
                        <img src="images/line-dec.png" alt="waves">
                        <p>Danh sách thành viên</p>
                    </div>
                </div>
                <div class="col-lg-6">
                    <ul class="features-items">
                        <li class="feature-item">
                            <div class="left-icon">
                                <img src="images/features-first-icon.png" alt="First One">
                            </div>
                            <div class="right-content">
                                <h4>Thành</h4>
                                <p><em>"Mã số sinh viên: 1851050130 ---------------------------------------------------------------------------------------------------------"</em></p>
                            </div>
                        </li>
                        <li class="feature-item">
                            <div class="left-icon">
                                <img src="images/features-first-icon.png" alt="second one">
                            </div>
                            <div class="right-content">
                                <h4>Tựu</h4>
                                <p><em>"Mã số sinh viên: 1851050179 ---------------------------------------------------------------------------------------------------------"</em></p>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="col-lg-6">
                    <ul class="features-items">
                        <li class="feature-item">
                            <div class="left-icon">
                                <img src="images/features-first-icon.png" alt="fourth muscle">
                            </div>
                            <div class="right-content">
                                <h4>Thành</h4>
                                <p><em>"Mã số sinh viên: 1851050130---------------------------------------------------------------------------------------------------------"</em></p>
                            </div>
                        </li>
                        <li class="feature-item">
                            <div class="left-icon">
                                <img src="images/features-first-icon.png" alt="training fifth">
                            </div>
                            <div class="right-content">
                                <h4>Tựu</h4>
                                <p><em>"Mã số sinh viên: 1851050179---------------------------------------------------------------------------------------------------------"</em></p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <br>

            <div class="main-button text-center">
                <a href="membership">Read More</a>
            </div>
        </div>
    </section>
    <!-- ***** Membership Item End ***** -->