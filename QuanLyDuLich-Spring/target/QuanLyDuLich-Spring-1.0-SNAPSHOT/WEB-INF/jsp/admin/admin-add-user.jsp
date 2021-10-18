<%-- 
    Document   : change-password
    Created on : Aug 12, 2021, 10:04:06 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="sidebar" data-color="blue" data-image="${pageContext.request.contextPath}/resources/assets/img/sidebar.jpg">
    <div class="sidebar-wrapper">
        <div class="logo">
            <a href="http://www.creative-tim.com" class="simple-text">
                TWIN TOUR
            </a>
        </div>
        <ul class="nav">
            <li>
                <a class="nav-link" href="<c:url value="/admin" />">
                    <i class="nc-icon nc-chart-pie-35"></i>
                    <p>Dashboard</p>
                </a>
            </li>
            <li class="nav-item active">
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
            <a class="navbar-brand" style="margin-top: 0" href="#pablo"> Edit Profile <i class="nc-icon nc-palette"></i></a>
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
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">Edit Profile</h4>
            </div>
            <div class="card-body">
                <c:url value="/admin/users/add" var="action"/>
                <form:form method="post" action="${action}" modelAttribute="user" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <h6 class="mb-3 text-primary">Personal Details</h6>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label>First Name</label>
                                <form:input path="firstName" class="form-control" id="firstName" placeholder="Enter your first name"/>
                                <form:errors path="firstName" element="div" cssClass="alert alert-danger" />
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label>Last Name</label>
                                <form:input path="lastName" class="form-control" id="lastName" placeholder="Enter your last name"/>
                                <form:errors path="lastName" element="div" cssClass="alert alert-danger" />
                            </div>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12">
                            <div class="form-group">
                                <label for="exampleInputUsername">Username</label>
                                <form:input path="username" class="form-control" id="username" placeholder="Enter your username"/>
                                <form:errors path="username" element="div" cssClass="alert alert-danger" />
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <form:input path="email" class="form-control" id="email" placeholder="Enter your email"/>
                                <form:errors path="email" element="div" cssClass="alert alert-danger" />
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12">
                            <div class="form-group">
                                <label>Phone</label>
                                <form:input path="phone" class="form-control" id="phone" placeholder="Enter your phone"/>
                                <form:errors path="phone" element="div" cssClass="alert alert-danger" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label>About You</label>
                                <form:input path="about" class="form-control" id="about" placeholder="Enter your infomation"/>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label>Date Of Birth</label>
                                <form:input type="date" path="birth" class="form-control" id="birth" placeholder="Enter your birth day"/>
                                <form:errors path="birth" element="div" cssClass="alert alert-danger" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label>Gender</label>
                                <div>
                                    <form:select path="gender" class="form-select" style="width: 100%" aria-label="Default select example">
                                        <form:option value="">What is your gender?</form:option>
                                        <form:option value="male">Male</form:option>
                                        <form:option value="female">Female</form:option>
                                    </form:select>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <label>Role</label>
                            <form:select path="role" class="form-select" style="width: 100%" aria-label="Default select example">
                                <form:option value="">What is your role?</form:option>
                                <form:option value="ROLE_ADMIN">ADMIN</form:option>
                                <form:option value="ROLE_BUSINESS">BUSINESS</form:option>
                                <form:option value="ROLE_SALESMAN">SALESMAN</form:option>
                                <form:option value="ROLE_MANAGER">MANAGER</form:option>
                                <form:option value="ROLE_USER">USER</form:option>
                            </form:select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="form-group">
                                <label>Image</label>
                                <div>
                                    <form:input type="file" id="file" path="file" cssClass="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <h6 class="mb-3 text-primary">Address</h6>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label>Street</label>
                                <form:input path="street" class="form-control" id="street" placeholder="Enter your street"/>
                                <form:errors path="street" element="div" cssClass="alert alert-danger" />
                            </div>
                        </div>  
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group" >
                                <label for="province">Province</label>
                                <div>
                                    <form:select path="province" class="form-select" style="width: 100%" aria-label="Default select example">
                                        <c:forEach items="${provinces}" var="p">
                                                <c:choose>
                                                    <c:when test="${provinceId == p.id}">
                                                      <form:option value="${p.id}" selected="true">${p.name}</form:option>
                                                    </c:when>
                                                    <c:otherwise>
                                                      <form:option value="${p.id}">${p.name}</form:option>
                                                    </c:otherwise>
                                                </c:choose>  
                                        </c:forEach>
                                    </form:select>
                                    <form:hidden path="active"/>
                                    <form:hidden path="avatar"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <h6 class="mb-3 text-primary">Your Password</h6>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label for="password">Password</label>
                                <form:password path="password" class="form-control" id="password" placeholder="Enter your password"/>
                                <form:errors path="password" element="div" cssClass="alert alert-danger" />
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">                                                
                                <label for="confirm_password">Confirm Password</label>
                                <form:password path="confirmPassword" class="form-control" id="confirm_password" placeholder="Enter your confirm password"/>
                                <form:errors path="confirmPassword" element="div" cssClass="alert alert-danger" />
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-info btn-fill pull-right">Add User</button>
                    <div class="clearfix"></div>
                </form:form>
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