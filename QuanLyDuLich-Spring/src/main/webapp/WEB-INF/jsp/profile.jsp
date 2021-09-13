<%-- 
    Document   : profile
    Created on : Aug 12, 2021, 2:20:53 PM
    Author     : Windows-1909
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="resources/css/profile.css">

<div class="container">
<div class="row gutters">
	<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
		<div class="card h-100">
			<div class="card-body">
				<div class="account-settings">
					<div class="user-profile">
						<div class="user-avatar">
                                                    <img src="${user.avatar}" alt="User Avatar">
						</div>
						<h5 class="user-name">${user.firstName} ${user.lastName}</h5>
						<h6 class="user-email">${user.email}</h6>
					</div>
					<div class="about">
						<h5 class="mb-2 text-primary">About</h5>
						<p>${user.about}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
		<div class="card h-100">
			<div class="card-body">
                            <c:url value="/your-profile" var="action"/>
                            <form:form method="post" action="${action}" modelAttribute="user" enctype="multipart/form-data">
				<div class="row gutters">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<h6 class="mb-3 text-primary">Personal Details</h6>
					</div>
					<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group">
                                                    <label for="firstName">First Name</label>
                                                    <form:input path="firstName" class="form-control" id="firstName" placeholder="Enter your first name"/>
                                                    <form:errors path="firstName" element="div" cssClass="alert alert-danger" />
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="form-group">
                                                        <label for="lastName">Last Name</label>
                                                        <form:input path="lastName" class="form-control" id="lastName" placeholder="Enter your last name"/>
                                                        <form:errors path="lastName" element="div" cssClass="alert alert-danger" />
                                                </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="form-group">
                                                        <label for="phone">Phone</label>
                                                        <form:input path="phone" class="form-control" id="phone" placeholder="Enter your phone number"/>
                                                        <form:errors path="phone" element="div" cssClass="alert alert-danger" />
                                                </div>
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="form-group">
                                                        <label for="birth">Date Of Birth</label>
                                                        <form:input path="birth" class="form-control" id="birth" placeholder="Enter your birth day"/>
                                                        <form:errors path="birth" element="div" cssClass="alert alert-danger" />
                                                </div>  
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="form-group" >
                                                        <label for="gender">Gender</label>
                                                        <form:select path="gender" name="cars" class="custom-select" style="background: var(--input-color); border: 1px solid  var(--border-color); font-size: .825rem; color: var(--inputtext-color)">
                                                            <form:option value="">What is your gender?</form:option>
                                                            <form:option value="male">Male</form:option>
                                                            <form:option value="female">Female</form:option>
                                                        </form:select>
                                                </div>
                                        </div>
					<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
						<div class="form-group">
                                                    <label for="file">Avatar</label>
                                                    <form:input type="file" id="file" path="file" cssClass="form-control"/>
						</div>
					</div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                                            <div class="form-group">
                                                <label for="about">About You</label>
                                                <form:input path="about" class="form-control" id="about" placeholder="Enter your infomation"/>
                                            </div>
                                        </div>
                                </div>
				<div class="row gutters">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<h6 class="mb-3 text-primary">Address</h6>
					</div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                                <div class="form-group">
                                                        <label for="street">Street</label>
                                                        <form:input path="street" class="form-control" id="street" placeholder="Enter your street"/>
                                                        <form:errors path="street" element="div" cssClass="alert alert-danger" />
                                                </div>  
                                        </div>
                                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                                            <div class="form-group" >
                                                    <label for="province">Province</label>
                                                    <form:select path="province" name="province" class="custom-select" style="background: var(--input-color); border: 1px solid  var(--border-color); font-size: .825rem; color: var(--inputtext-color)">
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
                                            </div>
                                        </div>
                                </div><br>
				<div class="row gutters">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="text-right">
							<button type="button" id="submit" name="submit" class="btn btn-secondary">Cancel</button>
							<input value="Update" type="submit" id="submit" name="submit" class="btn btn-primary"/>
						</div>
					</div>
				</div>
                            </form:form>
			</div>
		</div>
	</div>
</div>
</div>
<footer style="margin-top: 8%;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <p style="color: var(--text-color);">
                        Copyright © 2021 TWIN TOUR
                        - Developed by <a href="#">Thành Tựu</a>
                    </p>
                </div>
            </div>
        </div>
</footer>