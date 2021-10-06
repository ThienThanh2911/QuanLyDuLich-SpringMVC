<%-- 
    Document   : change-password
    Created on : Aug 12, 2021, 10:04:06 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="sidebar" data-color="blue" data-image="${pageContext.request.contextPath}/resources/assets/img/sidebar.jpg">
    <div class="sidebar-wrapper">
        <div class="logo">
            <a href="http://www.creative-tim.com" class="simple-text">
                TWIN TOUR
            </a>
        </div>
        <ul class="nav">
            <li>
                <c:url value="/admin/dashboard" var="url" />
                <a class="nav-link" href="${url}">
                    <i class="nc-icon nc-chart-pie-35"></i>
                    <p>Dashboard</p>
                </a>
            </li>
            <li>
                <a class="nav-link" href="./user.html">
                    <i class="nc-icon nc-circle-09"></i>
                    <p>QUẢN LÝ TÀI KHOẢN</p>
                </a>
            </li>
            <li>
                <a class="nav-link" href="./table.html">
                    <i class="nc-icon nc-notes"></i>
                    <p>QUẢN LÝ DU LỊCH</p>
                </a>
            </li>
            <li>
                <a class="nav-link" href="./typography.html">
                    <i class="nc-icon nc-notes"></i>
                    <p>QUẢN LÝ BÀI VIẾT</p>
                </a>
            </li>
            <li>
                <a class="nav-link" href="./icons.html">
                    <i class="nc-icon nc-paper-2"></i>
                    <p>BÌNH LUẬN DU LỊCH</p>
                </a>
            </li>
            <li>
                <a class="nav-link" href="./maps.html">
                    <i class="nc-icon nc-paper-2"></i>
                    <p>BÌNH LUẬN BÀI VIẾT</p>
                </a>
            </li>
            <li>
                <a class="nav-link" href="./notifications.html">
                    <i class="nc-icon nc-bank"></i>
                    <p>QUẢN LÝ HÓA ĐƠN</p>
                </a>
            </li>
            <li>
                <a class="nav-link" href="./maps.html">
                    <i class="nc-icon nc-pin-3"></i>
                    <p>BẢN ĐỒ</p>
                </a>
            </li>
            <li class="nav-item active active-pro">
                <c:url value="/" var="home" />
                <a class="nav-link active" href="${home}">
                    <i class="nc-icon nc-alien-33"></i>
                    <p>Back to Home</p>
                </a>
            </li>
        </ul>
    </div>
</div>
<div class="main-panel">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg " color-on-scroll="500">
        <div class="container-fluid">
            <a class="navbar-brand" style="margin-top: 0" href="#pablo"> Map <i class="nc-icon nc-palette"></i></a>
            <div class="collapse navbar-collapse justify-content-end" id="navigation">
                <ul class="nav navbar-nav mr-auto">
                    <li class="nav-item">
                        <input class="nav-link" style="border: 0;" placeholder="Search..."/>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nc-icon nc-zoom-split"></i>
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="no-icon">Account</span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#">Your Profile</a>
                            <a class="dropdown-item" href="#">Change Password</a>
                            <div class="divider"></div>
                            <a class="dropdown-item" href="#">Logout</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- End Navbar -->
    <div class="map-container">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.925050869163!2d106.67491355111834!3d10.817047661360876!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317528e1f241211f%3A0xc9ef195798144b1f!2zxJDhuqFpIGjhu41jIE3hu58gVFAuSENN!5e0!3m2!1svi!2s!4v1633108022907!5m2!1svi!2s" width="100%" height="100%" style="border:0;" allowfullscreen=True loading="lazy"></iframe>
    </div>
    <footer class="footer">
        <div class="container-fluid">
            <nav>
                <ul class="footer-menu">
                    <li>
                        <a href="#">
                            Home
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            Company
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            Portfolio
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            Blog
                        </a>
                    </li>
                </ul>
                <p class="copyright text-center">
                    ©
                    <script>
                        document.write(new Date().getFullYear())
                    </script>
                    <c:url value="/" var="home" />
                    <a href="${home}">Twin Tour</a> - Developed by Thành Tựu
                </p>
            </nav>
        </div>
    </footer>
</div>