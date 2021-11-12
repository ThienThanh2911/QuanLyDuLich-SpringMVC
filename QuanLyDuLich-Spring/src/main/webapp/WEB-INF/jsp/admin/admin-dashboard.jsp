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
            <c:if test="${adminUser.role.name() == 'ROLE_ADMIN'}">
                <li class="nav-item active">
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
                <div class="col-md-6">
                    <div class="card ">
                        <div class="card-header ">
                            <h4 class="card-title">The Most Popular Product Statistics</h4>
                            <p class="card-category">Biểu đồ thống kê sản phẩm bán chạy nhất</p>
                        </div>
                        <div id="chartContainer" style="height: 370px; width: 100%;"></div>
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
                                    <select id="selectYear" onchange="updateChart()" class="form-select" aria-label="Default select example" style="border: 0; border-bottom: 1px solid black">
                                        <option selected value="2021">Chọn năm</option>
                                        <option value="2020">Năm 2020</option>
                                        <option value="2021">Năm 2021</option>
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
                                    <p style="font-size: 20px"><strong id="monthTitle">Số liệu thống kê tháng</strong></p>
                                    <p class="card-text"><strong>Tổng số vé:</strong> <em id="monthTicket"></em></p>
                                    <p class="card-text"><strong>Tổng doanh thu:</strong> <em id="monthPrice"></em></p>
                                    <p class="card-text"><strong>Chọn tháng mà bạn muốn xem thống kê chi tiết:</strong> 
                                        <span>
                                            <select onchange="updateMonth()" id="selectMonth" class="form-select" aria-label="Default select example" style="border: 0; border-bottom: 1px solid black">
                                                <option selected value="11">Chọn tháng</option>
                                                <option value="1">Tháng 1</option>
                                                <option value="2">Tháng 2</option>
                                                <option value="3">Tháng 3</option>
                                                <option value="4">Tháng 4</option>
                                                <option value="5">Tháng 5</option>
                                                <option value="6">Tháng 6</option>
                                                <option value="7">Tháng 7</option>
                                                <option value="8">Tháng 8</option>
                                                <option value="9">Tháng 9</option>
                                                <option value="10">Tháng 10</option>
                                                <option value="11">Tháng 11</option>
                                                <option value="12">Tháng 12</option>
                                            </select>
                                        </span>
                                    </p>
                                </div>
                                <script>
                                    function updateMonth(){
                                        fetch(`/QuanLyDuLich-Spring/columnchart`,{
                                            method: 'post',
                                            body: JSON.stringify({
                                                "year": document.getElementById("selectYear").value
                                            }),
                                            headers:{
                                                'Content-Type': 'application/json'
                                            }
                                        }).then(function(res){
                                            return res.json();
                                        }).then(function(data){
                                            var m = document.getElementById("selectMonth").value
                                            document.getElementById("monthTitle").innerHTML = "Số liệu thống kê tháng " + m
                                            document.getElementById("monthTicket").innerHTML = data[m]["totalTicket"]
                                            document.getElementById("monthPrice").innerHTML = parseInt(data[m]["adult"]) + parseInt(data[m]["children"]) + " VNÐ"
                                        }).catch(function(err){
                                            console.error(err);
                                        });
                                    }
                                </script>
                                <div class="tab-pane" id="year" role="tabpanel" aria-labelledby="deals-tab">
                                    <p style="font-size: 20px"><strong id="yearTitle">Số liệu thống kê năm</strong></p>
                                    <p class="card-text"><strong>Tổng số vé:</strong> <em id="yearTicket"></em></p>
                                    <p class="card-text"><strong>Tổng doanh thu:</strong> <em id="yearPrice"></em></p>
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
            <div class="row">
                <div class="col-md-12">
                    <div class="card ">
                        <div class="card-header ">
                            <h4 class="card-title">Revenue Statistics</h4>
                            <p class="card-category">Biểu đồ thống kê doanh thu trong năm 2021</p>
                        </div>
                        <div id="chartContainer2" style="height: 370px; width: 100%;"></div>
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