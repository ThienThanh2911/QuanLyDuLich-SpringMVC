<%-- 
    Document   : admin-tours
    Created on : Aug 17, 2021, 12:15:53 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="../resources/css/signup.css">

<div class="container">
    <div class="card h-100">
        <c:url value="/admin/packages" var="action"/>
        <c:if test="${errMsg} != null">
            <div class="alert alert-danger">${errMsg}</div>
        </c:if>
        <form:form method="post" action="${action}" modelAttribute="packages" enctype="multipart/form-data">
            <div class="card-body">
                <div class="row gutters">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                <h6 class="mb-3 text-primary">Personal Details</h6>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label for="name">Ten tour</label>
                                <form:input type="text" id="name" path="name" cssClass="form-control"/>
                                <form:errors path="name" cssClass="alert alert-danger" element="div"/>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label for="startDate">Ngay khoi hanh</label>
                                <form:input type="date" id="start_date" path="startDate" cssClass="form-control"/>
                                <form:errors path="startDate" cssClass="alert alert-danger" element="div"/>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label for="finishDate">Ngay ket thuc</label>
                                <form:input type="date" id="finish_date" path="finishDate" cssClass="form-control"/>
                                <form:errors path="finishDate" cssClass="alert alert-danger" element="div"/>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label for="file">Mo ta tour</label>
                                <form:textarea  type="text" id="description" path="description" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label for="destination">Ten diem den</label>
                                <form:input type="text" id="destination" path="destination" cssClass="form-control"/>
                                <form:errors path="destination" cssClass="alert alert-danger" element="div"/>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label for="price">Gia tour</label>
                                <form:input type="text" id="price" path="price" cssClass="form-control"/>
                                <form:errors path="price" cssClass="alert alert-danger" element="div"/>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label for="cate">Danh muc</label>
                                <form:select id="cate" path="category" cssClass="form-control">
                                    <c:forEach items="${categories}" var="cat">
                                        <option value="${cat.id}">${cat.name}</option>
                                    </c:forEach>
                                </form:select>
                                <%--<form:input type="text" id="price" path="price" cssClass="form-control"/>--%>
                                <form:errors path="category" cssClass="alert alert-danger" element="div"/>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label for="vehicle">Phuong tien</label>
                                <form:select path="vehicle" name="vehicle" class="custom-select" style="background: var(--input-color); border: 1px solid  var(--border-color); font-size: .825rem; color: var(--inputtext-color)">
                                    <form:option value="">What is your vehicle?</form:option>
                                    <form:option value="OTO">Oto</form:option>
                                    <form:option value="PLANE">Plane</form:option>
                                    <form:option value="YACHT">Yacht</form:option>
                                </form:select>
                                <%--<form:input type="text" id="price" path="price" cssClass="form-control"/>--%>
                            </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                            <div class="form-group">
                                <label for="file">Anh tour</label>
                                <form:input type="file" id="file" path="file" cssClass="form-control"/>
                            </div>
                        </div>
                        <br>
                        <div class="row gutters">
                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="text-right">
                                                <!--<button type="button" id="submit" name="submit" class="btn btn-secondary">Cancel</button>-->
                                            <input type="submit" value="Them Tour" class="btn btn-danger"/>
                                        </div>
                                </div>
                        </div>
                </div>
            </div>
        </form:form>
    </div>
</div>
<footer style="margin-top: 15%;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p style="color: var(--text-color)">
                        Copyright © 2021 TWIN TOUR
                        - Developed by <a href="#">Thành Tựu</a>
                    </p>
                </div>
            </div>
        </div>
</footer>