<%-- 
    Document   : change-password
    Created on : Aug 12, 2021, 10:04:06 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="resources/css/change-password.css">

<div class="container">
    <div class="card h-100">
        <c:if test="${param.error != null}">
            <div class="alert alert-danger">
                Da co loi xay ra!
            </div>
        </c:if>
        <c:url value="/signin" var="action" />
        <form action="${action}" method="post">
            <div class="card-body">
                <div>
                        <h6 class="mb-3 text-primary">Login</h6>
                </div>
                <div>
                    <div class="form-group">
                            <label for="username">Username</label>
                            <input name="username" type="text" class="form-control" id="username" placeholder="Enter your username"/>
                    </div>
                </div>
                <div>
                    <div class="form-group">
                        <label for="password">Password</label>
                            <input name="password" type="password" class="form-control" id="password" placeholder="Enter your password"/>
                    </div>
                </div><br>
                <div class="row gutters">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                            <div class="text-left">
                                <a href="signup" style="font-size: 12px;">Create your new Account?</a>
                            </div>
                    </div>
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-6">
                            <div class="text-right">
                                    <button type="button" id="submit" name="submit" class="btn btn-secondary">Cancel</button>
                                    <input type="submit" id="submit" name="submit" class="btn btn-primary" value="Sign In"/>
                            </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<footer style="margin-top: 30%;">
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