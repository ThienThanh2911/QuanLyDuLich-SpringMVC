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
    <div class="card h-100" style="top: 110px">
            <c:if test="${errMsg != null}">
                <div class="alert alert-danger">
                    ${errMsg}
                </div>
            </c:if>
            <c:url value="/signup" var="action"/>
            <form:form method="post" action="${action}" modelAttribute="user">
                <div class="card-body">
                        <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <h6 class="mb-3 text-primary">Thông tin cá nhân</h6>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="lastName">Họ</label>
                                                <form:input path="lastName" class="form-control" id="lastName" placeholder="Hãy nhập họ của bạn"/>
                                                <form:errors path="lastName" element="div" cssClass="alert alert-danger" />
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="firstName">Tên</label>
                                                <form:input path="firstName" class="form-control" id="firstName" placeholder="Hãy nhập tên của bạn"/>
                                                <form:errors path="firstName" element="div" cssClass="alert alert-danger" />
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="username">Tài khoản</label>
                                                <form:input path="username" class="form-control" id="username" placeholder="Hãy nhập tài khoản của bạn"/>
                                                <form:errors path="username" element="div" cssClass="alert alert-danger" />
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="email">Email</label>
                                                <form:input path="email" class="form-control" id="email" placeholder="Hãy nhập email của bạn"/>
                                                <form:errors path="email" element="div" cssClass="alert alert-danger" />
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="phone">Số điện thoại</label>
                                                <form:input path="phone" class="form-control" id="phone" placeholder="Hãy nhập số điện thoại của bạn"/>
                                                <form:errors path="phone" element="div" cssClass="alert alert-danger" />
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="birth">Ngày sinh</label>
                                                <form:input path="birth" class="form-control" id="birth" placeholder="Hãy nhập ngày sinh của bạn"/>
                                                <form:errors path="birth" element="div" cssClass="alert alert-danger" />
                                        </div>  
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group" >
                                                <label for="gender">Giới tính</label>
                                                <form:select path="gender" name="cars" class="custom-select" style="background: var(--input-color); border: 1px solid  var(--border-color); font-size: .825rem; color: var(--inputtext-color)">
                                                    <form:option value="">Giới tính của bạn là?</form:option>
                                                    <form:option value="male">Nam</form:option>
                                                    <form:option value="female">Nữ</form:option>
                                                </form:select>
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label for="about">Thông tin về bạn</label>
                                            <form:textarea path="about" class="form-control" id="about" placeholder="Hãy nhập thông tin của bạn"/>
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="street">Địa chỉ</label>
                                                <form:input path="street" class="form-control" id="street" placeholder="Hãy nhập địa chỉ của bạn"/>
                                                <form:errors path="street" element="div" cssClass="alert alert-danger" />
                                        </div>  
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group" >
                                                <label for="province">Tỉnh thành</label>
                                                <form:select path="province" name="province" class="custom-select" style="background: var(--input-color); border: 1px solid  var(--border-color); font-size: .825rem; color: var(--inputtext-color)">
                                                    <form:option value="">Tỉnh thành nơi bạn sống?</form:option>
                                                    <c:forEach items="${provinces}" var="p">
                                                        <form:option value="${p.id}">${p.name}</form:option>
                                                    </c:forEach>
                                                </form:select>
                                        </div>
                                </div>
                        </div>
                        <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <h6 class="mb-3 text-primary">Mật khẩu của bạn</h6>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                                <label for="password">Mật khẩu</label>
                                                <form:password path="password" class="form-control" id="password" placeholder="Hãy nhập mật khẩu của bạn"/>
                                                <form:errors path="password" element="div" cssClass="alert alert-danger" />
                                        </div>
                                </div>
                                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">                                                
                                                <label for="confirm_password">Xác thực mật khẩu</label>
                                                <form:password path="confirmPassword" class="form-control" id="confirm_password" placeholder="Hãy nhập lại mật khẩu của bạn"/>
                                                <form:errors path="confirmPassword" element="div" cssClass="alert alert-danger" />
                                        </div>
                                </div>
                        </div><br>
                        <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="text-right">
                                                <input value="Đăng Ký" type="submit" id="submit" name="submit" class="btn btn-primary"/>
                                        </div>
                                </div>
                        </div>
                </div>
            </form:form>
    </div>
</div>
<footer style="margin-top: 3%;">
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