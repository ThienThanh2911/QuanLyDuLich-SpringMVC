<%-- 
    Document   : terms
    Created on : Aug 15, 2021, 10:49:59 AM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="section section-bg" id="call-to-action" style="background-image: url(${pageContext.request.contextPath}/images/banner-image-1-1920x500.jpg)">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 offset-lg-1">
                    <div class="cta-content">
                        <br>
                        <br>
                        <h2>Invoice <em>Details</em></h2>
                        <p>Thông tin hóa đơn chi tiết</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ***** Our Classes Start ***** -->
    <section class="section" id="our-classes">
        <div class="container">
            <br>
            <br>
            <br>
          
            <div class="card shadow" style="background-color: var(--card-color);">
                <div class="card-header">
                    <h4 class="card-title" style="color: var(--text-color);">
                        <strong>${payment.tour.name}</strong>
                        <span class="float-right">Invoice #${payment.id}</span>
                    </h4>
                </div>
                <div class="card-body">
                    <h5 style="color: var(--text-color);">Client Information<span class="float-right">Payment Details</span></h5>
                    <p class="card-text">${payment.user.lastName} ${payment.user.firstName}<span class="float-right">CustomerID: ${payment.user.id}</span></p>
                    <p class="card-text">${payment.user.phone}<span class="float-right">Invoice date: <fmt:formatDate pattern = "dd/MM/yyyy HH:mm:ss" value = "${payment.createdDate}" /></span></p>
                    <p class="card-text">${payment.user.street} ${payment.user.province.name}<span class="float-right">Payment method: ${payment.method}</span></p>
                    <h4 style="border-bottom: 2px solid var(--text-color); margin: 20px 200px 40px 200px"></h4>
                    <table class="table" style="border: none">
                        <thead class="theme-dark" style="background-color: var(--table-color); color: var(--tabletext-color)">
                            <tr>
                                <th scope="col" class="text-center">Type</th>
                                <th scope="col" class="text-center">Quantity</th>
                                <th scope="col"></th>
                                <th scope="col"></th>
                                <th scope="col" class="text-right">Price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="text-center" style="color: #7a7a7a">Người lớn</td>
                                <td class="text-center" style="color: #7a7a7a">${payment.adult}</td>
                                <td></td>
                                <td></td>
                                <td class="text-right" style="color: #7a7a7a"><fmt:formatNumber value="${payment.tour.price * payment.adult}" type="currency" currencySymbol="" minFractionDigits="0"/><sup>đ</sup></td>
                            </tr>
                            <tr>
                                <td class="text-center" style="color: #7a7a7a">Trẻ em</td>
                                <td class="text-center" style="color: #7a7a7a">${payment.children}</td>
                                <td></td>
                                <td></td>
                                <td class="text-right" style="color: #7a7a7a"><fmt:formatNumber value="${(payment.tour.price * payment.children)*70/100}" type="currency" currencySymbol="" minFractionDigits="0"/><sup>đ</sup></td>
                            </tr>
                            <tr>
                                <th scope="row"></th>
                                <td></td>
                                <td></td>
                                <td class="text-center" style="background-color: var(--table-color); color: var(--tabletext-color); font-size: 20px">TOTAL</td>
                                <td class="text-right" style="background-color: var(--tabletotal-color); color: var(--tabletext-color); font-size: 20px"><fmt:formatNumber value="${payment.price}" type="currency" currencySymbol="" minFractionDigits="0"/><sup>đ</sup></td>
                            </tr>
                        </tbody>
                    </table>
                    <style>
                        .table thead tr th, .table tbody tr td, .table tbody tr th {
                            border: none;
                        }
                    </style>
                </div>
                <div class="card-footer">
                    <div class="text-center" style="color: var(--text-color);"><strong>THANK YOU FOR CHOOSING OUR SERVICE!</strong></div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Our Classes End ***** -->