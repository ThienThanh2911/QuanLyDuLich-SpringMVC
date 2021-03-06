<%-- 
    Document   : admin-tours
    Created on : Aug 17, 2021, 12:15:53 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/apipayment.js"></script>
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
                <li>
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
                <li class="nav-item active">
                    <a class="nav-link" href="<c:url value="/admin/payments" />">
                        <i class="nc-icon nc-bank"></i>
                        <p>QUẢN LÝ HÓA ĐƠN</p>
                    </a>
                </li>
            </c:if>
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
            <a class="navbar-brand" style="margin-top: 0" href="#pablo"> Payments <i class="nc-icon nc-palette"></i></a>
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
                        var input = document.getElementById("inputSearch");
                        console.log(input.value);
                        document.getElementById("search").href = '/QuanLyDuLich-Spring/admin/payments?username='+input.value;
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
                        <h4 class="card-title">Invoice Management Panel</h4>
                        <p class="card-category">Bảng quản lý hóa đơn</p>
                    </div>
                    <div class="card-body table-full-width table-responsive">
                        <table class="table table-hover table-striped">
                            <thead>
                                <th>Image</th>
                                <th>Customer</th>
                                <th>Tour ID</th>
                                <th>Method</th>
                                <th>Total bill</th>
                                <th>Created date</th>
                                <th>Status</th>
                                <th style="text-align: center!important">Edit</th>
                                <th>Remove</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${payments}" var="p">
                                    <tr id="payment${p.id}">
                                        <td><img src="${p.tour.photos}" alt="${p.tour.name}" width="120px" style="border-radius:3px"/></td>
                                        <td>${p.user.username}</td>
                                        <td>${p.tour.id}</td>
                                        <td>${p.method.name()}</td>
                                        <td><fmt:formatNumber value="${p.price}" type="currency" currencySymbol="" minFractionDigits="0"/><sup>đ</sup></td>
                                        <td>${p.createdDate}</td>
                                        <c:if test="${p.status == 'PAID'}">
                                            <td><span class="badge badge-pill badge-success">Đã thanh toán</span></td>
                                        </c:if>
                                        <c:if test="${p.status == 'UNPAID'}">
                                            <td><span class="badge badge-pill badge-warning">Chưa thanh toán</span></td>
                                        </c:if>
                                        <c:if test="${p.status == 'EXPIRED'}">
                                            <td><span class="badge badge-pill badge-danger">Đã hết hạn</span></td>
                                        </c:if>
                                        <td class="text-center">
                                            <c:url value="/admin/payments"  var="url"/>
                                            <button type="button" onclick="window.location.href=`${url}/${p.id}/edit`" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-link">
                                                <i class="fa fa-edit"></i>
                                            </button>
                                        </td>
                                        <td class="text-center" style="height:105px">
                                            <button onclick="removePayment(${p.id})" type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                                                <i class="fa fa-remove"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <ul class="pagination justify-content-center">
                            <c:forEach begin="1" end="${countPage}" var="i">
                                <li class="page-item"><a class="page-link" href="<c:url value="/admin/payments" />?page=${i}">${i}</a></li>
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