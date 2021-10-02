<%-- 
    Document   : admin-tours
    Created on : Aug 17, 2021, 12:15:53 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

=======
<div class="sidebar" data-image="../resources/assets/img/sidebar.jpg">
    <div class="sidebar-wrapper">
        <div class="logo">
            <a href="http://www.creative-tim.com" class="simple-text">
                TWIN TOUR
            </a>
        </div>
        <ul class="nav">
            <li>
                <a class="nav-link" href="dashboard.html">
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
            <li class="nav-item active">
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
            <a class="navbar-brand" href="#pablo"> Tours </a>
            <button href="" class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-bar burger-lines"></span>
                <span class="navbar-toggler-bar burger-lines"></span>
                <span class="navbar-toggler-bar burger-lines"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navigation">
                <ul class="nav navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="#" class="nav-link" data-toggle="dropdown">
                            <i class="nc-icon nc-palette"></i>
                            <span class="d-lg-none">Dashboard</span>
                        </a>
                    </li>
                    <li class="dropdown nav-item">
                        <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                            <i class="nc-icon nc-planet"></i>
                            <span class="notification">5</span>
                            <span class="d-lg-none">Notification</span>
                        </a>
                        <ul class="dropdown-menu">
                            <a class="dropdown-item" href="#">Notification 1</a>
                            <a class="dropdown-item" href="#">Notification 2</a>
                            <a class="dropdown-item" href="#">Notification 3</a>
                            <a class="dropdown-item" href="#">Notification 4</a>
                            <a class="dropdown-item" href="#">Another notification</a>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <input class="nav-link" style="border: 0" placeholder="Search..."/>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nc-icon nc-zoom-split"></i>
                        </a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#pablo">
                            <span class="no-icon">Account</span>
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="no-icon">Dropdown</span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                            <div class="divider"></div>
                            <a class="dropdown-item" href="#">Separated link</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#pablo">
                            <span class="no-icon">Log out</span>
                        </a>
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
                        <h4 class="card-title">Striped Table with Hover</h4>
                        <p class="card-category">Here is a subtitle for this table</p>
                    </div>
                    <div class="card-body table-full-width table-responsive">
                        <table class="table table-hover table-striped">
                            <thead>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Salary</th>
                                <th>Country</th>
                                <th>City</th>
                                <th style="width: 60px">Active</th>
                                <th style="text-align: center!important">Edit</th>
                                <th>Remove</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Dakota Rice</td>
                                    <td>$36,738</td>
                                    <td>Niger</td>
                                    <td>Oud-Turnhout</td>
                                    <td class="text-center"><i class="fa fa-check-circle" style="color:green"></i></td>
                                    <td class="text-center">
                                        <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-link">
                                            <i class="fa fa-edit"></i>
                                        </button>
                                    </td>
                                    <td class="text-center">
                                        <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                                            <i class="fa fa-remove"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Minerva Hooper</td>
                                    <td>$23,789</td>
                                    <td>Curaçao</td>
                                    <td>Sinaai-Waas</td>
                                    <td class="text-center"><i class="fa fa-check-circle" style="color:green; text-align: center"></i></td>
                                    <td class="text-center">
                                        <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-link">
                                            <i class="fa fa-edit"></i>
                                        </button>
                                    </td>
                                    <td class="text-center">
                                        <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                                            <i class="fa fa-remove"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Sage Rodriguez</td>
                                    <td>$56,142</td>
                                    <td>Netherlands</td>
                                    <td>Baileux</td>
                                    <td class="text-center"><i class="fa fa-check-circle" style="color:green; text-align: center"></i></td>
                                    <td class="text-center">
                                        <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-link">
                                            <i class="fa fa-edit"></i>
                                        </button>
                                    </td>
                                    <td class="text-center">
                                        <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                                            <i class="fa fa-remove"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>Philip Chaney</td>
                                    <td>$38,735</td>
                                    <td>Korea, South</td>
                                    <td>Overland Park</td>
                                    <td class="text-center"><i class="fa fa-check-circle" style="color:green; text-align: center"></i></td>
                                    <td class="text-center">
                                        <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-link">
                                            <i class="fa fa-edit"></i>
                                        </button>
                                    </td>
                                    <td class="text-center">
                                        <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                                            <i class="fa fa-remove"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>Doris Greene</td>
                                    <td>$63,542</td>
                                    <td>Malawi</td>
                                    <td>Feldkirchen in Kärnten</td>
                                    <td class="text-center"><i class="fa fa-check-circle" style="color:green; text-align: center"></i></td>
                                    <td class="text-center">
                                        <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-link">
                                            <i class="fa fa-edit"></i>
                                        </button>
                                    </td>
                                    <td class="text-center">
                                        <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                                            <i class="fa fa-remove"></i>
                                        </button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>Mason Porter</td>
                                    <td>$78,615</td>
                                    <td>Chile</td>
                                    <td>Gloucester</td>
                                    <td class="text-center"><i class="fa fa-check-circle" style="color:green; text-align: center"></i></td>
                                    <td class="text-center">
                                        <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-link">
                                            <i class="fa fa-edit"></i>
                                        </button>
                                    </td>
                                    <td class="text-center">
                                        <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                                            <i class="fa fa-remove"></i>
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
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