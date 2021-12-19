<%-- 
    Document   : admin-tours
    Created on : Aug 17, 2021, 12:15:53 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/apiblog.js"></script>
=======
<div class="sidebar" data-color="blue" data-image="${pageContext.request.contextPath}/resources/assets/img/sidebar.jpg">
    <div class="sidebar-wrapper">
        <div class="logo">
            <a href="http://www.creative-tim.com" class="simple-text">
                TWIN TOUR
            </a>
        </div>
        <ul class="nav">
            <c:if test="${adminUser.role.name() == 'ROLE_ADMIN'}">
                <li>
                    <a class="nav-link" href="<c:url value="/admin" />">
                        <i class="nc-icon nc-chart-pie-35"></i>
                        <p>BẢNG ĐIỀU KHIỂN</p>
                    </a>
                </li>
            </c:if>
            <c:if test="${adminUser.role.name() != 'ROLE_SALESMAN'}">
                <li>
                    <a class="nav-link" href="<c:url value="/admin/users" />">
                        <i class="nc-icon nc-circle-09"></i>
                        <p>QUẢN LÝ TÀI KHOẢN</p>
                    </a>
                </li>
            </c:if>
            <c:if test="${adminUser.role.name() != 'ROLE_SALESMAN'}">
                <li>
                    <a class="nav-link" href="<c:url value="/admin/packages" />">
                        <i class="nc-icon nc-notes"></i>
                        <p>QUẢN LÝ DU LỊCH</p>
                    </a>
                </li>
            </c:if>
            <c:if test="${adminUser.role.name() != 'ROLE_SALESMAN'}">
                <li class="nav-item active">
                    <a class="nav-link" href="<c:url value="/admin/blogs" />">
                        <i class="nc-icon nc-notes"></i>
                        <p>QUẢN LÝ BÀI VIẾT</p>
                    </a>
                </li>
            </c:if>
            <c:if test="${adminUser.role.name() != 'ROLE_SALESMAN'}">
                <li>
                    <a class="nav-link" href="<c:url value="/admin/commenttours" />">
                        <i class="nc-icon nc-paper-2"></i>
                        <p>BÌNH LUẬN DU LỊCH</p>
                    </a>
                </li>
            </c:if>
            <c:if test="${adminUser.role.name() != 'ROLE_SALESMAN'}">
                <li>
                    <a class="nav-link" href="<c:url value="/admin/commentblogs" />">
                        <i class="nc-icon nc-paper-2"></i>
                        <p>BÌNH LUẬN BÀI VIẾT</p>
                    </a>
                </li>
            </c:if>
            <c:if test="${adminUser.role.name() != 'ROLE_BUSINESS'}">
                <li>
                    <a class="nav-link" href="<c:url value="/admin/payments" />">
                        <i class="nc-icon nc-bank"></i>
                        <p>QUẢN LÝ HÓA ĐƠN</p>
                    </a>
                </li>
            </c:if>
            <li>
                <a class="nav-link" href="<c:url value="/admin/map" />">
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
            <a class="navbar-brand" style="margin-top: 0" href="#pablo"> Blogs <i class="nc-icon nc-palette"></i></a>
            <div class="collapse navbar-collapse justify-content-end" id="navigation">
                <ul class="nav navbar-nav mr-auto">
                    <li class="nav-item">
                        <input id="inputSearch" class="nav-link" style="border: 0;" placeholder="Search..."/>
                    </li>
                    <li class="nav-item">
                        <a id="search" href="" onclick="Search()" class="nav-link">
                            <i class="nc-icon nc-zoom-split"></i>
                        </a>
                    </li>
                </ul>
                <script>
                    function Search() {
                        var input = document.getElementById("inputSearch")
                        console.log(input.value)
                        document.getElementById("search").href = '/QuanLyDuLich-Spring/admin/blogs?titlename='+input.value
                    }
                </script>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="no-icon">Account</span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="<c:url value="/admin/profile" />">Your Profile</a>
                            <div class="divider"></div>
                            <a class="dropdown-item" href="<c:url value="/logout" />">Logout</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="content">
        <div class="container-fluid">
            <div class="col-md-12">
                <div class="card strpied-tabled-with-hover">
                    <div class="card-header ">
                        <h4 class="card-title">Striped Table with Hover<a href="<c:url value="/admin/blogs/add" />" class="btn btn-primary btn-lg active" role="button" aria-pressed="true" style="position:absolute; right:10px"><i class="fa fa-plus" style="text-align: center"></i>Add Blog</a></h4>
                        <p class="card-category">Here is a subtitle for this table</p>
                    </div>
                    <div class="card-body table-full-width table-responsive">
                        <table class="table table-hover table-striped">
                            <thead>
                                <th>Image</th>
                                <th>Blog title</th>
                                <th>Username</th>
                                <th>Created date</th>
                                <th>Rating</th>
                                <th>Comments</th>
                                <th style="width: 60px">Active</th>
                                <th style="text-align: center!important">Edit</th>
                                <th>Remove</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${blogs}" var="b">
                                    <tr id="blog${b.id}">
                                        <td><img src="${b.photos}" alt="${b.title}" width="120px" style="border-radius:3px"/></td>
                                        <td>${b.title}</td>
                                        <td>${b.user.username}</td>
                                        <td><fmt:formatDate pattern = "dd-MM-yyyy HH:mm:ss" value = "${b.createdDate}" /></td>
                                        <td>${b.rateblog.size()} đánh giá</td>
                                        <td><a href="<c:url value="/admin/commentblogs" />?blogId=${b.id}">${b.commentblog.size()} bình luận</a></td>
                                        <td class="text-center">
                                            <c:if test="${b.active == true}">
                                                <button id="buttonblog${b.id}" onclick="setActiveBlog(${b.id})" type="button" rel="tooltip" title="Deactive Blog" class="btn btn-info btn-simple btn-link">
                                                    <i id="iblog${b.id}" class="fa fa-check-circle" style="color:green; text-align: center"></i>
                                                </button>
                                            </c:if>
                                            <c:if test="${b.active == false}">
                                                <button id="buttonblog${b.id}" onclick="setActiveBlog(${b.id})" type="button" rel="tooltip" title="Active Blog" class="btn btn-info btn-simple btn-link">
                                                    <i id="iblog${b.id}" class="fa fa-check-circle" style="color:red; text-align: center"></i>
                                                </button>
                                            </c:if>
                                        </td>
                                        <td class="text-center">
                                            <c:url value="/admin/blogs"  var="url"/>
                                            <button onclick="window.location.href=`${url}/${b.id}/edit`" type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-link">
                                                <i class="fa fa-edit"></i>
                                            </button>
                                        </td>
                                        <td class="text-center" style="height:105px">
                                            <button onclick="removeBlog(${b.id})" type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                                                <i class="fa fa-remove"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <ul class="pagination justify-content-center">
                            <c:forEach begin="1" end="${countBlogs}" var="i">
                                <li class="page-item"><a class="page-link" href="<c:url value="/admin/blogs" />?page=${i}">${i}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
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