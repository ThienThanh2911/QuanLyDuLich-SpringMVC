<%-- 
    Document   : admin-tours
    Created on : Aug 17, 2021, 12:15:53 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/commenttour.js"></script>
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
                <li class="nav-item active">
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
            <a class="navbar-brand" style="margin-top: 0" href="#pablo"> Comment Tour <i class="nc-icon nc-palette"></i></a>
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
    <div class="content">
        <div class="container-fluid">
            <div class="col-md-12">
                <div class="card card-user">
                    <div class="card-body">
                        <img src="${tour.photos}" height="100%" width="100%" alt="..." class="img-thumbnail">
                        <p class="description text-center">
                            <span style="font-size: 20px; "><strong>${tour.name}</strong></span>
                            <br>Giá vé: ${tour.price}VNĐ
                            <br>Danh mục: ${tour.category.name}
                            <c:if test="${tour.vehicle == 'YACHT'}">
                                <br>Phương tiện di chuyển: Du thuyền
                            </c:if>
                            <c:if test="${tour.vehicle == 'OTO'}">
                                <br>Phương tiện di chuyển: Ô tô
                            </c:if>
                            <c:if test="${tour.vehicle == 'PLANE'}">
                                <br>Phương tiện di chuyển: Máy bay
                            </c:if>
                            <br>
                            <c:forEach items="${tour.tags}" var="t">
                                <span class="badge badge-pill badge-secondary" style="font-size:13px">${t.name}</span>
                            </c:forEach>
                        </p>
                    </div>
                    <hr>
                    <div class="button-container mr-auto ml-auto">
                        <span><i class="nc-icon nc-square-pin"></i> Điểm đến ${tour.destination}</span>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="card strpied-tabled-with-hover">
                    <div class="card-header ">
                        <h4 class="card-title">Tour Comment Management Panel</h4>
                        <p class="card-category">Bảng quản lý bình luận trên Tour</p>
                    </div>
                    <div class="card-body table-full-width table-responsive">
                        <table class="table table-hover table-striped">
                            <thead>
                                <th>Avatar</th>
                                <th>User</th>
                                <th>Comment</th>
                                <th>Created Date</th>
                                <th>Remove</th>
                            </thead>
                            <tbody>
                                <c:forEach items="${commenttours}" var="c">
                                    <tr id="comment${c.id}">
                                        <td>${c.user.avatar}</td>
                                        <td>${c.user.username}</td>
                                        <td>${c.comment}</td>
                                        <td>${c.created_date}</td>
                                        <td class="text-center">
                                            <button onclick="removeComment(${c.id})" type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-link">
                                                <i class="fa fa-remove"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <ul class="pagination justify-content-center">
                            <c:forEach begin="1" end="${countPage}" var="i">
                                <li class="page-item"><a class="page-link" href="<c:url value="/admin/commenttours" />?page=${i}">${i}</a></li>
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