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
                            <li><a href="${home}" class="active">Trang chủ</a></li>
                            <li><a href="<c:url value="/packages" />">Danh sách tours</a></li>
                            <li><a href="<c:url value="/blog" />">Tin tức</a></li>
                            <li><a href="<c:url value="/contact" />">Liên hệ</a></li> 
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Giới thiệu</a>
                              
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="<c:url value="/about" />">Về chúng tôi</a>
                                    <a class="dropdown-item" href="<c:url value="/membership" />">Thành viên</a>
                                    <a class="dropdown-item" href="<c:url value="/terms" />">Điều khoản</a>
                                </div>
                            </li>
                            <li class="dropdown">
                                <c:choose>
                                    <c:when test="${pageContext.request.userPrincipal.name == null}">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Tài khoản</a>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="<c:url value="/signup" />">Đăng ký</a>
                                            <a class="dropdown-item" href="<c:url value="/signin" />">Đăng nhập</a>
                                        </div>
                                    </c:when>
                                    <c:when test="${pageContext.request.userPrincipal.name != null}">
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Tài khoản</a>
                                        <div class="dropdown-menu">
                                            <c:if test="${accessToken == null}">
                                                <c:if test="${user.role.name() != 'ROLE_USER'}">
                                                    <a class="dropdown-item" href="<c:url value="/admin" />">Trang quản trị</a>
                                                </c:if>
                                            </c:if>
                                            <a class="dropdown-item" href="<c:url value="/payment-history" />">Lịch sử thanh toán</a>
                                            <a class="dropdown-item" href="<c:url value="/your-profile" />">Thông tin cá nhân</a>
                                            <a class="dropdown-item" href="<c:url value="/change-password" />">Đổi mật khẩu</a>
                                            <a class="dropdown-item" href="<c:url value="/logout" />">Đăng xuất</a>
                                        </div>
                                    </c:when>
                                </c:choose>
                            </li>
                            <li>
                                <label style="margin-top:10px">
                                    <input type="checkbox" id="icon" />
                                    <span class="check"></span>
                                </label>
                                <style>
                                    input[type="checkbox"] {
                                        -webkit-appearance: none;
                                        visibility: hidden;
                                        display: none;
                                    }

                                    .check {
                                        position: relative;
                                        display: block;
                                        width: 40px;
                                        height: 20px;
                                        background: #092c3e;
                                        cursor: pointer;
                                        border-radius: 20px;
                                        overflow: hidden;
                                        transition: ease-in 0.5s;
                                    }
                                    
                                    input[type="checkbox"]:checked ~ .check {
                                        background: #fff;
                                    }
                                    
                                    .check:before {
                                        content: '';
                                        position: absolute;
                                        top: 2px;
                                        left: 2px;
                                        background: #fff;
                                        width: 16px;
                                        height: 16px;
                                        border-radius: 50%;
                                        transition: 0.5s;
                                    }
                                    
                                    input[type="checkbox"]:checked ~ .check:before {
                                        transform: translateX(-50px);
                                    }
                                    
                                    .check:after {
                                        content: '';
                                        position: absolute;
                                        top: 2px;
                                        right: 2px;
                                        background: #FFCC33;
                                        width: 16px;
                                        height: 16px;
                                        border-radius: 50%;
                                        transition: 0.5s;
                                        transform: translateX(50px);
                                    }
                                    
                                    input[type="checkbox"]:checked ~ .check:after {
                                        transform: translateX(0px);
                                    }
                                </style>
                                <script>
                                    var icon = document.getElementById("icon");
                                    
                                    if(localStorage.getItem("theme") == null) {
                                        localStorage.setItem("theme", "light");
                                    }
                                    
                                    let localData = localStorage.getItem("theme");
                                    
                                    if(localData == "light") {
                                        document.body.classList.remove("dark-theme");
                                    }
                                    else if(localData == "dark") {
                                        document.body.classList.add("dark-theme");
                                        icon.checked = true;
                                    }
                                    
                                    icon.onclick = function() {
                                        document.body.classList.toggle("dark-theme");
                                        if(document.body.classList.contains("dark-theme")){
                                            localStorage.setItem("theme", "dark");
                                        }else{
                                            localStorage.setItem("theme", "light");
                                        }
                                    }
                                </script>
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