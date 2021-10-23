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
            <li class="nav-item active">
                <a class="nav-link" href="<c:url value="/admin" />">
                    <i class="nc-icon nc-chart-pie-35"></i>
                    <p>Dashboard</p>
                </a>
            </li>
            <li>
                <a class="nav-link" href="<c:url value="/admin/users" />">
                    <i class="nc-icon nc-circle-09"></i>
                    <p>QUẢN LÝ TÀI KHOẢN</p>
                </a>
            </li>
            <li>
                <a class="nav-link" href="<c:url value="/admin/packages" />">
                    <i class="nc-icon nc-notes"></i>
                    <p>QUẢN LÝ DU LỊCH</p>
                </a>
            </li>
            <li>
                <a class="nav-link" href="<c:url value="/admin/blogs" />">
                    <i class="nc-icon nc-notes"></i>
                    <p>QUẢN LÝ BÀI VIẾT</p>
                </a>
            </li>
            <li>
                <a class="nav-link" href="<c:url value="/admin/commenttours" />">
                    <i class="nc-icon nc-paper-2"></i>
                    <p>BÌNH LUẬN DU LỊCH</p>
                </a>
            </li>
            <li>
                <a class="nav-link" href="<c:url value="/admin/commentblogs" />">
                    <i class="nc-icon nc-paper-2"></i>
                    <p>BÌNH LUẬN BÀI VIẾT</p>
                </a>
            </li>
            <li>
                <a class="nav-link" href="<c:url value="/admin/payments" />">
                    <i class="nc-icon nc-bank"></i>
                    <p>QUẢN LÝ HÓA ĐƠN</p>
                </a>
            </li>
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
            <a class="navbar-brand" style="margin-top: 0" href="#pablo"> Dashboard <i class="nc-icon nc-palette"></i></a>
            <div class="collapse navbar-collapse justify-content-end" id="navigation">
                <ul class="navbar-nav ml-auto">
                    <li class="dropdown nav-item">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                            <i class="nc-icon nc-planet"></i>
                            <span class="notification">!</span>
                            <span class="d-lg-none">Notification</span>
                        </a>
                        <ul class="dropdown-menu">
                            <c:forEach items="${unpaidpayments}" var="unpaid">
                                <a class="dropdown-item" href="#">${unpaid.user.username} ${unpaid.price}</a>
                            </c:forEach>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="no-icon">Account</span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="<c:url value="/admin/users/${adminProfileId}/edit" />">Your Profile</a>
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
                <div class="col-md-4">
                    <div class="card ">
                        <div class="card-header ">
                            <h4 class="card-title">The Most Popular Product Statistics</h4>
                            <p class="card-category">Biểu đồ thống kê sản phẩm bán chạy nhất</p>
                        </div>
                        <div class="card-body ">
                            <div id="chartPreferences" class="ct-chart ct-perfect-fourth"></div>
                            <div class="legend">
                                <i class="fa fa-circle text-info"></i> Tour miền Nam
                                <i class="fa fa-circle text-danger"></i> Tour miền Bắc
                                <i class="fa fa-circle text-warning"></i> Tour miền Trung
                            </div>
                            <hr>
                            <div class="stats">
                                <i class="nc-icon nc-layers-3"></i> Thống kê số liệu 3 sản phẩm bán chạy nhất
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="card ">
                        <div class="card-header ">
                            <h4 class="card-title">Revenue Statistics</h4>
                            <p class="card-category">Biểu đồ thống kê doanh thu trong năm 2021</p>
                        </div>
                        <div class="card-body ">
                            <div id="chartActivity" class="ct-chart"></div>
                        </div>
                        <div class="card-footer ">
                            <div class="legend">
                                <i class="fa fa-circle text-info"></i> Vé người lớn
                                <i class="fa fa-circle text-danger"></i> Vé trẻ em
                            </div>
                            <hr>
                            <div class="stats">
                                <i class="fa fa-check"></i> Data information certified
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="card ">
                        <div class="card-header ">
                            <h4 class="card-title">Revenue statistics for all years</h4>
                            <p class="card-category">Biểu đồ thống kê doanh thu của tất cả các năm</p>
                        </div>
                        <div class="card-body ">
                            <div id="chartActivity2" class="ct-chart"></div>
                        </div>
                        <div class="card-footer ">
                            <div class="legend">
                                <i class="fa fa-circle text-info"></i> Vé người lớn
                                <i class="fa fa-circle text-danger"></i> Vé trẻ em
                            </div>
                            <hr>
                            <div class="stats">
                                <i class="fa fa-check"></i> Data information certified
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card  card-tasks">
                        <div class="card-header ">
                            <h4 class="card-title">Statistics</h4>
                            <p class="card-category">Chi tiết thống kê doanh thu theo thời gian</p>
                        </div>
                        <div class="card-body ">
                            <p><strong>Nhập năm mà bạn muốn xem thống kê chi tiết:</strong> 
                                <span>
                                    <select class="form-select" aria-label="Default select example" style="border: 0; border-bottom: 1px solid black">
                                        <option selected>Chọn năm</option>
                                        <option value="1">Năm 2020</option>
                                        <option value="2">Năm 2021</option>
                                    </select>
                                </span>
                            </p>
                            <ul class="nav nav-tabs card-header-tabs" id="bologna-list" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#month" role="tab" aria-controls="description" aria-selected="true">Theo tháng</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#year" role="tab" aria-controls="deals" aria-selected="false">Theo năm</a>
                                </li>
                             </ul>
                            <div class="card-body">
                            <div class="tab-content">
                                <div class="tab-pane active" id="month" role="tabpanel">
                                    <p style="font-size: 20px"><strong>Số liệu thống kê tháng 9</strong></p>
                                    <p class="card-text"><strong>Tổng số vé:</strong> <em>100</em></p>
                                    <p class="card-text"><strong>Tổng doanh thu:</strong> <em>100.000.000VNĐ</em></p>
                                    <p class="card-text"><strong>Chọn tháng mà bạn muốn xem thống kê chi tiết:</strong> 
                                        <span>
                                            <select class="form-select" aria-label="Default select example" style="border: 0; border-bottom: 1px solid black">
                                                <option selected>Chọn tháng</option>
                                                <option value="1">Tháng 1</option>
                                                <option value="2">Tháng 2</option>
                                                <option value="3">Tháng 3</option>
                                                <option value="1">Tháng 4</option>
                                                <option value="2">Tháng 5</option>
                                                <option value="3">Tháng 6</option>
                                                <option value="1">Tháng 7</option>
                                                <option value="2">Tháng 8</option>
                                                <option value="3">Tháng 9</option>
                                                <option value="1">Tháng 10</option>
                                                <option value="2">Tháng 11</option>
                                                <option value="3">Tháng 12</option>
                                            </select>
                                        </span>
                                    </p>
                                </div>

                                <div class="tab-pane" id="year" role="tabpanel" aria-labelledby="deals-tab">
                                    <p style="font-size: 20px"><strong>Số liệu thống kê năm 2021</strong></p>
                                    <p class="card-text"><strong>Tổng số vé:</strong> <em>1000</em></p>
                                    <p class="card-text"><strong>Tổng doanh thu:</strong> <em>999.000.000VNĐ</em></p>
                                </div>
                            </div>
                            </div>
                        </div>
                        <div class="card-footer ">
                            <hr>
                            <div class="stats">
                                <i class="fa fa-history"></i> Update data when using
                            </div>
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