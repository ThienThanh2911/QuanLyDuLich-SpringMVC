<%-- 
    Document   : change-password
    Created on : Aug 12, 2021, 10:04:06 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/apifortour.js"></script>

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
                        <p>Dashboard</p>
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
            <a class="navbar-brand" style="margin-top: 0" href="#pablo"> Edit Payment <i class="nc-icon nc-palette"></i></a>
            <div class="collapse navbar-collapse justify-content-end" id="navigation">
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
    <!-- End Navbar -->
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-12">
                    <div class="card strpied-tabled-with-hover">
                        <div class="card-header">
                            <h4 class="card-title">Payment Information
                                <span class="float-right">Invoice #${payment.id}</span>
                            </h4>
                        </div>
                        <div class="card-body">
                            <h5 style="color: var(--text-color); font-weight:700;">Client Information<span class="float-right">Payment Details</span></h5>
                            <p class="card-text" style="">${payment.user.lastName} ${payment.user.firstName}<span class="float-right">CustomerID: ${payment.user.id}</span></p>
                            <p class="card-text">${payment.user.phone}<span class="float-right">Invoice date: <fmt:formatDate pattern = "dd/MM/yyyy HH:mm:ss" value = "${payment.createdDate}" /></span></p>
                            <p class="card-text">${payment.user.street} ${payment.user.province.name}<span class="float-right">Payment method: ${payment.method}</span></p>
                            <h4 style="border-bottom: 2px solid black; margin: 20px 200px 40px 200px"></h4>
                            <div class="card-body table-full-width table-responsive">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <th>Type</th>
                                        <th style="text-align: center!important">Quantity</th>
                                        <th class="clearfix"></th>
                                        <th></th>
                                        <th style="text-align: right!important; width: 120px;">Price</th>
                                        <th></th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td style="color: #7a7a7a">Người lớn</td>
                                            <td class="text-center" style="color: #7a7a7a">${payment.adult}</td>
                                            <td></td>
                                            <td></td>
                                            <td class="text-right" style="color: #7a7a7a; width: 120px;"><fmt:formatNumber value="${payment.tour.price * payment.adult}" type="currency" currencySymbol="" minFractionDigits="0"/><sup>đ</sup></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td style="color: #7a7a7a">Trẻ em</td>
                                            <td class="text-center" style="color: #7a7a7a">${payment.children}</td>
                                            <td></td>
                                            <td></td>
                                            <td class="text-right" style="color: #7a7a7a; width: 120px;"><fmt:formatNumber value="${(payment.tour.price * payment.children)*70/100}" type="currency" currencySymbol="" minFractionDigits="0"/><sup>đ</sup></td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <th scope="row"></th>
                                            <td></td>
                                            <td></td>
                                            <td class="text-center" style="font-weight: 700; font-size: 20px;">TOTAL</td>
                                            <td class="text-right" style="font-weight: 700;font-size: 20px;"><fmt:formatNumber value="${payment.price}" type="currency" currencySymbol="" minFractionDigits="0"/><sup>đ</sup></td>
                                            <td></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <style>
                                .clearfix {
                                    width: calc(1020px - 250px - 200px - 205px - 60px)
                                }
                            </style>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12">
                    <div class="card card-user">
                        <div class="card-body">
                            <img src="${payment.tour.photos}" height="100%" width="100%" alt="..." class="img-thumbnail">
                            <p class="description text-center">
                                <span style="font-size: 20px; "><strong>${payment.tour.name}</strong></span>
                                <br>Giá vé: ${payment.tour.price}VNĐ
                                <br>Danh mục: ${payment.tour.category.name}
                                <c:if test="${payment.tour.vehicle == 'YACHT'}">
                                    <br>Phương tiện di chuyển: Du thuyền
                                </c:if>
                                <c:if test="${payment.tour.vehicle == 'OTO'}">
                                    <br>Phương tiện di chuyển: Ô tô
                                </c:if>
                                <c:if test="${payment.tour.vehicle == 'PLANE'}">
                                    <br>Phương tiện di chuyển: Máy bay
                                </c:if>
                                <br>
                                <c:forEach items="${payment.tour.tags}" var="t">
                                    <span class="badge badge-pill badge-secondary" style="font-size:13px">${t.name}</span>
                                </c:forEach>
                                <br>
                                <c:if test="${payment.status == 'PAID'}">
                                    <span class="badge badge-pill badge-success" style="font-size:13px">Đã thanh toán</span>
                                </c:if>
                                <c:if test="${payment.status == 'UNPAID'}">
                                    <span class="badge badge-pill badge-warning" style="font-size:13px">Chưa thanh toán</span>
                                </c:if>
                                <c:if test="${payment.status == 'EXPIRED'}">
                                    <span class="badge badge-pill badge-danger" style="font-size:13px">Đã hết hạn</span>
                                </c:if>
                            </p>
                        </div>
                        <hr>
                        <div class="button-container mr-auto ml-auto">
                            <span><i class="nc-icon nc-square-pin"></i> Điểm đến ${payment.tour.destination}</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row"> 
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Edit Payment Information</h4>
                        </div>
                        <div class="card-body">
                            <c:if test="${errMsg} != null">
                                <div class="alert alert-danger">${errMsg}</div>
                            </c:if>
                            <c:url value="/admin/payments/${paymentId}/edit" var="action"/>
                            <form:form method="post" action="${action}" modelAttribute="payment" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="form-group">
                                            <label>Status</label>
                                            <form:select path="status" class="form-select" style="width: 100%" aria-label="Default select example">
                                                <form:option value="">Trạng thái hóa đơn?</form:option>
                                                <form:option value="PAID">Đã thanh toán</form:option>
                                                <form:option value="UNPAID">Chưa thanh toán</form:option>
                                                <form:option value="EXPIRED">Đã hết hạn</form:option>
                                            </form:select>
                                            <form:hidden path="createdDate"/>
                                            <form:hidden path="method"/>
                                            <form:hidden path="price"/>
                                            <form:hidden path="tour"/>
                                            <form:hidden path="user"/>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-info btn-fill pull-right">Update Payments</button>
                                <div class="clearfix"></div>
                            </form:form>
                        </div>
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