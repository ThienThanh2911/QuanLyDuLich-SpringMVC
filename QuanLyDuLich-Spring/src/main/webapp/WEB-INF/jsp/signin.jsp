<%-- 
    Document   : change-password
    Created on : Aug 12, 2021, 10:04:06 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="resources/css/change-password.css">

<div class="container">
    <div class="card h-100">
        <c:if test="${param.error != null}">
            <div class="alert alert-danger">
                Đã có lỗi xảy ra!
            </div>
        </c:if>
        <c:if test="${param.accessDenied != null}">
            <div class="alert alert-danger">
                Bạn không có quyền truy cập!
            </div>
        </c:if>
        <c:url value="/signin" var="action" />
        <form action="${action}" method="post">
            <div class="card-body">
                <div>
                        <h6 class="mb-3 text-primary">Đăng Nhập</h6>
                </div>
                <div>
                    <div class="form-group">
                            <label for="username">Tài khoản</label>
                            <input name="username" type="text" class="form-control" id="username" placeholder="Hãy nhập tài khoản của bạn"/>
                    </div>
                </div>
                <div>
                    <div class="form-group">
                        <label for="password">Mật khẩu</label>
                            <input name="password" type="password" class="form-control" id="password" placeholder="Hãy nhập mật khẩu của bạn"/>
                    </div>
                </div><br>
                <div class="row gutters">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                            <div class="text-left">
                                <a href="signup" style="font-size: 12px;">Đăng ký tài khoản mới?</a>
                            </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                            <div class="text-right">
                                    <input type="submit" id="submit" name="submit" class="btn btn-primary" value="Đăng Nhập"/>
                            </div>
                    </div>
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/QuanLyDuLich-Spring/signin-google&response_type=code
    &client_id=282559155698-m5vjui8150iamdmm8d7dk7gdugp6in8l.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>
                </div>
            </div>
        </form>
    </div>
</div>
<footer style="margin-top: 28%;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p style="color: var(--text-color);">
                        Copyright © 2021 TWIN TOUR
                        - Developed by <a href="#">Thành Tựu</a>
                    </p>
                </div>
            </div>
        </div>
</footer>