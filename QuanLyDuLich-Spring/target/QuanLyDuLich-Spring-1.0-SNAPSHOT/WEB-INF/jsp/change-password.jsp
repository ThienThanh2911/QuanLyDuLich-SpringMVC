<%-- 
    Document   : change-password
    Created on : Aug 12, 2021, 10:04:06 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="resources/css/change-password.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <div class="card h-100">
        <div class="card-body">
            <c:if test="${not empty msgSuccess}">
                <div class="alert alert-success">
                    ${msgSuccess}
                </div>
            </c:if>
            <c:if test="${not empty msgError}">
                <div class="alert alert-danger">
                    ${msgError}
                </div>
            </c:if>
            <c:url value="/change-password" var="action"/>
            <form method="post" action="${action}">
                <div>
                        <h6 class="mb-3 text-primary">Change Password</h6>
                </div>
                <div>
                    <div class="form-group">
                            <label for="oldPassword">Old Password</label>
                            <input type="password" class="form-control" name="oldPassword" id="oldPassword" placeholder="Enter your old password">
                    </div>
                </div>
                <div>
                    <div class="form-group">
                            <label for="newPassword">New Password</label>
                            <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="Enter your new password">
                    </div>
                </div>
                <div>
                    <div class="form-group">
                            <label for="confirmNewPassword">Confirm Password</label>
                            <input type="password" class="form-control" name="confirmNewPassword" id="confirmNewPassword" placeholder="Enter your new password again">
                    </div>
                </div><br>
                <div class="row gutters">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                            <div class="text-right">
                                    <button type="button" id="submit" name="submit" class="btn btn-secondary">Cancel</button>
                                    <input type="submit" id="submit" name="submit" class="btn btn-primary" value="Change Password"/>
                            </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<footer style="margin-top: 25%;">
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