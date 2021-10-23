<%-- 
    Document   : terms
    Created on : Aug 15, 2021, 10:49:59 AM
    Author     : Windows-1909
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="section section-bg" id="call-to-action" style="background-image: url(${pageContext.request.contextPath}/images/banner-image-1-1920x500.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="cta-content">
                        <br>
                        <br>
                        <h2>Payment <em>History</em></h2>
                        <p>Lịch sử thanh toán hóa đơn của bạn</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ***** Our Classes Start ***** -->
    <section class="section" id="payment-history">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3">
                    <div class="section-heading">
                        <h2>All <em>Bills</em></h2>
                        <img src="images/line-dec.png" alt="">
                        <p>Bạn đang có danh sách tổng cộng ${payments.size()} hóa đơn</p>
                    </div>
                </div>
            </div>
            <c:forEach items="${payments}" var="p">
                <div class="card shadow" style="background-color: var(--card-color); border-radius: 5px; margin-bottom: 40px; padding-bottom: 20px;">
                    <h5 class="card-header" style="color: var(--text-color); border-top-left-radius: 5px; border-top-right-radius: 5px;">Hóa đơn số #${p.id}</h5>
                    <div class="row no-gutters">
                    <div class="col-md-3">
                        <div class="col-md-12" style="height: 100%; padding-top: 20px;">
                            <img src="${p.tour.photos}" style="border-radius: 5px;" width="100%" height="100%" alt="">
                        </div>
                    </div>
                        <div class="col-md-9">
                            <div class="card-body">
                                <h5 class="card-title" style="color: var(--text-color)">${p.tour.name}</h5>
                                <p class="card-text">Ngày thanh toán: <fmt:formatDate pattern = "dd/MM/yyyy HH:mm:ss" value = "${p.createdDate}" /></p>
                                <p class="card-text">Tổng hóa đơn: ${p.price}đ</p>
                                <p class="card-text">Tình trạng thanh toán: <span class="badge badge-pill badge-success">${p.status}</span></p>
                                <a href="<c:url value="/payment-history/" />${p.id}" class="btn btn-primary float-right">Chi tiết hóa đơn</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </section>
        </div>
    </section>
    <!-- ***** Our Classes End ***** -->