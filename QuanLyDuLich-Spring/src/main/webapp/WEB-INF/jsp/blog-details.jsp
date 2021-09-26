<%-- 
    Document   : blog-details
    Created on : Aug 15, 2021, 10:05:08 AM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="section section-bg" id="call-to-action" style="background-image: url(${pageContext.request.contextPath}/images/banner-image-1-1920x500.jpg)">
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
                <h4>${blog.title}</h4>

                <p><i class="fa fa-user"></i> ${blog.user.username} &nbsp;|&nbsp; <i class="fa fa-calendar"></i> ${blog.createdDate} &nbsp;|&nbsp; <i class="fa fa-comments"></i>  15 comments</p>

                <div><img src="images/blog-image-fullscren-1-1920x700.jpg" alt=""></div>

                <br>

                <p>${blog.description}</p>
                
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
                <c:if test="${rate != 0}">
                    <div class="rating"> 
                        <c:set value="${5}" var="a"/>
                        <c:forEach begin="1" end="5" var="i">
                            <c:if test="${rate == a}">
                                <input type="radio" name="rating" value="${a}" id="${a}" checked="true">
                            </c:if>
                            <c:if test="${rate != a}">
                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                    <input type="radio" name="rating"  onClick="setRatingBlog(${a}, ${user.id}, ${blog.id})" value="${a}" id="${a}">
                                </c:if>
                                <c:if test="${pageContext.request.userPrincipal.name == null}">
                                    <input type="radio" name="rating"  onClick="setRatingBlog(${a}, null, ${blog.id})" value="${a}" id="${a}">
                                </c:if>
                            </c:if>
                            <label for="${a}">☆</label>
                            <c:set value="${a-1}" var="a"/>
                        </c:forEach>
                    </div>
                </c:if>
                <c:if test="${rate == 0}">
                    <div class="rating">
                        <input type="radio" name="rating" onClick="setRatingBlog(5, ${user.id}, ${blog.id})" value="5" id="5">
                        <label for="5">☆</label>
                        <input type="radio" name="rating" onClick="setRatingBlog(4, ${user.id}, ${blog.id})" value="4" id="4">
                        <label for="4">☆</label>
                        <input type="radio" name="rating" onClick="setRatingBlog(3, ${user.id}, ${blog.id})" value="3" id="3">
                        <label for="3">☆</label>
                        <input type="radio" name="rating" onClick="setRatingBlog(2, ${user.id}, ${blog.id})" value="2" id="2">
                        <label for="2">☆</label>
                        <input type="radio" name="rating" onClick="setRatingBlog(1, ${user.id}, ${blog.id})" value="1" id="1">
                        <label for="1">☆</label>
                    </div>
                </c:if>
                <c:set var="total" value="${0}" />
              <c:forEach var="r" items="${blog.rateblog}">
                <c:set var="total" value="${total + r.rate}" />
              </c:forEach>
              <c:if test="${total != 0}">
                  <div class="text-center" style="color: var(--text-color)">${total/blog.rateblog.size()} / ${blog.rateblog.size()} lượt đánh giá</div>
              </c:if>            
            <section class='tabs-content'>
                <div class="row" style="width:1200px">
                    <div class="col-lg-6" style="width:600px">
                        <h4>Comments</h4>
                        <ul id="commentArea" class="features-items">
                            <c:forEach items="${comments}" var="comment">
                                <li id="comment${comment.id}">
                                    <div class="feature-item" style="margin-bottom:15px;">
                                        <div class="left-icon user-avatar">
                                            <img src="${comment.user.avatar}" alt="First One" style="width:100px">
                                        </div>
                                        <div class="right-content">
                                            <h4>${comment.user.username}</h4>
                                            <p><em style="color: var(--text-color)">${comment.comment}</em></p>
                                            <p><a href="#"><i class="fa fa-thumbs-up"></i> Thích</a> | <a href="#"><i class="fa fa-comment"></i> Trả lời </a><c:if test="${pageContext.request.userPrincipal.name == comment.user.username}"> | <a href="javascript:void(0);" onClick="removeCommentBlog(${comment.id})"><i class="fa fa-remove"></i> Xóa </a></c:if>. <em class="date-comment-blog">${comment.created_date}</em></p>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <script>
                        window.onload = function(){
                            let dates = document.getElementsByClassName("date-comment-blog")
                            for(let i = 0; i < dates.length; i++){
                                let d = dates[i]
                                moment.locale('vi')
                                d.innerText = moment(d.innerText).fromNow();
                            }
                        }
                    </script>
                    <div class="col-lg-6">
                        <h4>Leave a comment</h4>
                        <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <div class="contact-form">
                              <div class="row">
                                <div class="col-lg-12">
                                  <fieldset>
                                    <textarea id="content" name="content" rows="6" id="content" placeholder="Message" required=""></textarea>
                                  </fieldset>
                                </div>
                                <div class="col-lg-12">
                                  <fieldset>
                                      <input type="hidden" id="userName" value="${user.username}">
                                      <input type="hidden" id="userAvatar" value="${user.avatar}">
                                      <button type="submit" id="form-submit" onClick="addCommentBlog(${user.id}, ${blog.id})" class="main-button">Submit</button>
                                  </fieldset>
                                </div>
                              </div>
                        </div>
                        </c:if>
                        <c:if test="${pageContext.request.userPrincipal.name == null}">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div>Bạn cần phải đăng nhập để bình luận về Blog này</div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </section>
        </div>
    </section>
    <!-- ***** Blog End ***** -->