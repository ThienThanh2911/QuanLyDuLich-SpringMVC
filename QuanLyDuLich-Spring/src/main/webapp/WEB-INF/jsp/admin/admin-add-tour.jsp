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
                <li class="nav-item active">
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
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Edit Tour Information</h4>
                        </div>
                        <div class="card-body">
                            <c:if test="${errMsg} != null">
                                <div class="alert alert-danger">${errMsg}</div>
                            </c:if>
                            <c:url value="/admin/packages/add" var="action"/>
                            <form:form method="post" action="${action}" modelAttribute="tour" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-xl-5 col-lg-5 col-md-5 col-sm-5 col-12">
                                        <div class="form-group">
                                            <label>Tour Name</label>
                                            <form:input type="text" id="name" path="name" cssClass="form-control" placeholder="Tên tour..."/>
                                            <form:errors path="name" cssClass="alert alert-danger" element="div"/>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-12">
                                        <div class="form-group">
                                            <label>Destination</label>
                                            <form:input type="text" id="destination" path="destination" placeholder="Điểm đến..." cssClass="form-control"/>
                                            <form:errors path="destination" cssClass="alert alert-danger" element="div"/>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12">
                                        <div class="form-group">
                                            <label>Price</label>
                                            <form:input type="text" id="price" path="price" placeholder="Giá vé..." cssClass="form-control"/>
                                            <form:errors path="price" cssClass="alert alert-danger" element="div"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label>Start Date</label>
                                            <form:input type="date" id="start_date" path="startDate" cssClass="form-control"/>
                                            <form:errors path="startDate" cssClass="alert alert-danger" element="div"/>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label>Finish Date</label>
                                            <form:input type="date" id="finish_date" path="finishDate" cssClass="form-control"/>
                                            <form:errors path="finishDate" cssClass="alert alert-danger" element="div"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label>Category</label>
                                            <div>
                                                <form:select id="cate" path="category" style="width: 100%" aria-label="Default select example" cssClass="form-select">
                                                    <c:forEach items="${categories}" var="cat">
                                                        <form:option value="${cat}">${cat.name}</form:option>
                                                    </c:forEach>
                                                </form:select>
                                                <form:errors path="category" cssClass="alert alert-danger" element="div"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                        <div class="form-group">
                                            <label>Vehicle</label>
                                            <div>
                                                <form:select aria-label="Default select example" style="width: 100%" path="vehicle" name="vehicle" class="form-select">
                                                    <form:option value="">What is your vehicle?</form:option>
                                                    <form:option value="OTO">Ô tô</form:option>
                                                    <form:option value="PLANE">Máy bay</form:option>
                                                    <form:option value="YACHT">Du thuyền</form:option>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col-12">
                                        <div class="form-group">
                                            <label>Tags</label>
                                            <div>
                                                <span>
                                                    <form:select path="tags" id="dropdownTag" title="Chọn Tag" data-max-options="5"  multiple="true" class="form-control selectpicker">
                                                        <c:forEach items="${listTags}" var="t">
                                                            <form:option value="${t.id}">${t.name}</form:option>
                                                        </c:forEach>
                                                    </form:select>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9 col-12">
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
                                        <div class="form-group">
                                            <label>Description</label>
                                            <form:textarea rows="4" cols="80" type="text" id="description" placeholder="Mô tả tour..." path="description" cssClass="form-control"/>
                                            <form:hidden path="active"/>
                                            <form:hidden path="photos"/>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-info btn-fill pull-right">Add Tour</button>
                                <div class="clearfix"></div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">List Categories</h4>
                        </div>
                        <div class="card-body">
                            <div class="card strpied-tabled-with-hover">
                                <div class="card-body table-full-width table-responsive">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                            <th>ID</th>
                                            <th>Category Name</th>
                                            <th>Remove</th>
                                        </thead>
                                        <tbody id="cateList">
                                            <c:forEach items="${listCates}" var="t">
                                                <tr id="cates${t.id}">
                                                    <td>${t.id}</td>
                                                    <td>${t.name}</td>
                                                    
                                                    <td class="text-center">
                                                        <button onclick="removeCate(${t.id})" type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                                                            <i class="fa fa-remove"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="form-group">
                                        <label>Category Name</label>
                                        <div>
                                            <input type="text" id="cateName" name="cateName" class="form-control"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <button onclick="addCate()" type="button" class="btn btn-info btn-fill pull-right">Add Category</button>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">List Tags</h4>
                        </div>
                        <div class="card-body">
                            <div class="card strpied-tabled-with-hover">
                                <div class="card-body table-full-width table-responsive">
                                    <table class="table table-hover table-striped">
                                        <thead>
                                            <th>ID</th>
                                            <th>Tag Name</th>
                                            <th>Remove</th>
                                        </thead>
                                        <tbody id="tagList">
                                            <c:forEach items="${listTags}" var="t">
                                                <tr id="tags${t.id}">
                                                    <td>${t.id}</td>
                                                    <td>${t.name}</td>
                                                    
                                                    <td class="text-center">
                                                        <button onclick="removeTag(${t.id})" type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                                                            <i class="fa fa-remove"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                    <div class="form-group">
                                        <label>Tag Name</label>
                                        <div>
                                            <input type="text" id="tagName" name="tagName" class="form-control"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <button onclick="addTag()" type="button" class="btn btn-info btn-fill pull-right">Add Tag</button>
                            <div class="clearfix"></div>
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