<%-- 
    Document   : blog-details
    Created on : Aug 15, 2021, 10:05:08 AM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<section class="section section-bg" id="call-to-action" style="background-image: url(images/banner-image-1-1920x500.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="cta-content">
                        <br>
                        <br>
                        <h2>Single <em>blog post</em></h2>
                        <p>Chi tiết bài viết</p>
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
            <section class='tabs-content'>
              <article>
                <h4>Bài viết số 1</h4>

                <p><i class="fa fa-user"></i> Thành &nbsp;|&nbsp; <i class="fa fa-calendar"></i> 15.08.2021 10:10 &nbsp;|&nbsp; <i class="fa fa-comments"></i>  15 comments</p>

                <div><img src="images/blog-image-fullscren-1-1920x700.jpg" alt=""></div>

                <br>

                <p>Nội dung 1</p>

                <p>Nội dung 2</p>
        
                <p>Nội dung 3</p>
                
                <p>Nội dung 4</p>
                
                <ul class="social-icons">
                    <li style="color: var(--text-color)">Share this:</li>
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                    <li><a href="#"><i class="fa fa-behance"></i></a></li>
                </ul>
              </article>
            </section>

            <br>
            <br>
            <br>
            
            <section class='tabs-content'>
                <div class="row">
                    <div class="col-md-8">
                        <h4>Comments</h4>
                        <ul class="features-items">
                            <li>
                                <div class="feature-item" style="margin-bottom:15px;">
                                    <div class="left-icon">
                                        <img src="images/features-first-icon.png" alt="First One">
                                    </div>
                                    <div class="right-content">
                                        <h4>Thành <small>15.08.2021 10:10</small></h4>
                                        <p><em>"Bình luận 1 -------------------------------------------------------------------------------------------------------------------------------------------------------"</em></p>
                                    </div>
                                </div>

                                <div class="tabs-content">
                                    <div class="feature-item" style="margin-bottom:15px;">
                                        <div class="left-icon">
                                            <img src="images/features-first-icon.png" alt="First One">
                                        </div>
                                        <div class="right-content">
                                            <h4>Thành <small>15.08.2021 11:10</small></h4>
                                            <p><em>"Bình luận 2 - Reply --------------------------------------------------------------------------------------------------------------------------------------------------"</em></p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="feature-item" style="margin-bottom:15px;">
                                <div class="left-icon">
                                    <img src="images/features-first-icon.png" alt="second one">
                                </div>
                                <div class="right-content">
                                    <h4>John Doe <small>15.08.2021 12:10</small></h4>
                                    <p><em>"Bình luận 3 -------------------------------------------------------------------------------------------------------------------------------------------------------"</em></p>
                                </div>
                            </li>
                        </ul>
                    </div>

                    <div class="col-md-4">
                        <h4>Leave a comment</h4>
                        
                        <div class="contact-form">
                            <form action="" method="post">
                              <div class="row">
                                <div class="col-lg-12">
                                  <fieldset>
                                    <input name="name" type="text" id="name" placeholder="Your Name*" required="">
                                  </fieldset>
                                </div>
                                <div class="col-lg-12">
                                  <fieldset>
                                    <input name="email" type="text" id="email" pattern="[^ @]*@[^ @]*" placeholder="Your Email*" required="">
                                  </fieldset>
                                </div>
                                <div class="col-lg-12">
                                  <fieldset>
                                    <textarea name="message" rows="6" id="message" placeholder="Message" required=""></textarea>
                                  </fieldset>
                                </div>
                                <div class="col-lg-12">
                                  <fieldset>
                                    <button type="submit" id="form-submit" class="main-button">Submit</button>
                                  </fieldset>
                                </div>
                              </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </section>
    <!-- ***** Blog End ***** -->