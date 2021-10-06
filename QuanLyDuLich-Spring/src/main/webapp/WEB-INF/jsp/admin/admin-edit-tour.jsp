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
                <c:url value="/admin/" var="url" />
                <a class="nav-link" href="${url}">
                    <i class="nc-icon nc-chart-pie-35"></i>
                    <p>Dashboard</p>
                </a>
            </li>
            <li>
                <c:url value="/admin/" var="url" />
                <a class="nav-link" href="${url}">
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
            <a class="navbar-brand" style="margin-top: 0" href="#pablo"> Edit Tour <i class="nc-icon nc-palette"></i></a>
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
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Edit Tour Information</h4>
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="row">
                                    <div class="col-md-5 pr-1">
                                        <div class="form-group">
                                            <label>Tour Name</label>
                                            <input type="text" class="form-control" placeholder="Tên tour..." value="">
                                        </div>
                                    </div>
                                    <div class="col-md-3 px-1">
                                        <div class="form-group">
                                            <label>Destination</label>
                                            <input type="text" class="form-control" placeholder="Điểm đến..." value="">
                                        </div>
                                    </div>
                                    <div class="col-md-4 pl-1">
                                        <div class="form-group">
                                            <label>Price</label>
                                            <input type="text" class="form-control" placeholder="Giá vé..." value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>Start Date</label>
                                            <input type="date" class="form-control" value="2021-10-01">
                                        </div>
                                    </div>
                                    <div class="col-md-6 pl-1">
                                        <div class="form-group">
                                            <label>Finish Date</label>
                                            <input type="date" class="form-control" value="2021-10-04">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 pr-1">
                                        <div class="form-group">
                                            <label>Category</label>
                                            <div>
                                                <select class="form-select" style="width: 100%" aria-label="Default select example">
                                                    <option selected>Danh mục tour</option>
                                                    <option value="1">Tour miền Nam</option>
                                                    <option value="2">Tour miền Bắc</option>
                                                    <option value="3">Tour miền Trung</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 pl-1">
                                        <div class="form-group">
                                            <label>Vehicle</label>
                                            <div>
                                                <select class="form-select" style="width: 100%" aria-label="Default select example">
                                                    <option selected>Phương tiện di chuyển</option>
                                                    <option value="1">Ô tô</option>
                                                    <option value="2">Máy bay</option>
                                                    <option value="3">Du thuyền</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3 pr-1">
                                        <div class="form-group">
                                            <label>Tag</label>
                                            <div style="width: 100%">
                                                <button class="btn dropdown-toggle btn-block" type="button" data-toggle="dropdown" width="100%" style="border: 1px solid #E3E3E3; color:black; text-align: left;"
                                                        aria-haspopup="true" aria-expanded="false">Chọn nhãn dán</button>

                                                <div class="dropdown-menu" style="width:95%">
                                                  <a class="dropdown-item">
                                                    <div class="custom-control custom-checkbox">
                                                      <input type="checkbox" style="margin: 2px 5px 0 0;" id="checkbox1">
                                                      <label class="custom-control-label" for="checkbox1">Bắc</label>
                                                    </div>
                                                  </a>
                                                  <a class="dropdown-item" href="#">
                                                    <div class="custom-control custom-checkbox">
                                                      <input type="checkbox" style="margin: 2px 5px 0 0;" id="checkbox2">
                                                      <label class="custom-control-label" for="checkbox2">Trung</label>
                                                    </div>
                                                  </a>
                                                  <a class="dropdown-item" href="#">
                                                    <div class="custom-control custom-checkbox">
                                                      <input type="checkbox" style="margin: 2px 5px 0 0;" id="checkbox3">
                                                      <label class="custom-control-label" for="checkbox3">Nam</label>
                                                    </div>
                                                  </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-9 pl-1">
                                        <div class="form-group">
                                            <label>Image</label>
                                            <div>
                                                <input type="file" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Description</label>
                                            <textarea rows="4" cols="80" class="form-control" placeholder="Mô tả tour..." value="">Tour miền Nam...</textarea>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-info btn-fill pull-right">Update Tour</button>
                                <div class="clearfix"></div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card card-user">
                        <div class="card-body">
                            <img src="../resources/images/blog-image-1-940x460.jpg" height="100%" width="100%" alt="..." class="img-thumbnail">
                            <p class="description text-center">
                                <span style="font-size: 20px; "><strong>Tour miền Nam</strong></span>
                                <br>Giá vé: 1.000.000VNĐ
                                <br>Danh mục: Tour miền nam
                                <br>Phương tiện di chuyển: Máy bay
                            </p>
                        </div>
                        <hr>
                        <div class="button-container mr-auto ml-auto">
                            <span><i class="nc-icon nc-square-pin"></i> Điểm đến TP.Hồ Chí Minh</span>
                        </div>
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