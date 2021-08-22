<%-- 
    Document   : admin-tours
    Created on : Aug 17, 2021, 12:15:53 PM
    Author     : Windows-1909
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url value="/admin/packages" var="action"/>
<c:if test="${errMsg} != null">
    <div class="alert alert-danger">${errMsg}</div>
</c:if>
<form:form method="post" action="${action}" modelAttribute="packages" enctype="multipart/form-data">
    <div class="form-group">
        <label for="name">Ten tour</label>
        <form:input type="text" id="name" path="name" cssClass="form-control"/>
        <form:errors path="name" cssClass="alert alert-danger" element="div"/>
    </div>
    <div class="form-group">
        <label for="file">Mo ta tour</label>
        <form:textarea  type="text" id="description" path="description" cssClass="form-control"/>
    </div>
    <div class="form-group">
        <label for="destination">Ten diem den</label>
        <form:input type="text" id="destination" path="destination" cssClass="form-control"/>
        <form:errors path="destination" cssClass="alert alert-danger" element="div"/>
    </div>
    <div class="form-group">
        <label for="price">Gia tour</label>
        <form:input type="text" id="price" path="price" cssClass="form-control"/>
        <form:errors path="price" cssClass="alert alert-danger" element="div"/>
    </div>
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
    <div class="form-group">
        <label for="file">Anh tour</label>
        <form:input type="file" id="file" path="file" cssClass="form-control"/>
    </div>
    <div class="form-group">
        <input type="submit" value="Them Tour" class="btn btn-danger"/>
    </div>
</form:form>
