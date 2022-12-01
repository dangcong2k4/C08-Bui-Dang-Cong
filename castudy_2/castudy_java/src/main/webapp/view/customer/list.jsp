<%--
  Created by IntelliJ IDEA.
  User: buida
  Date: 30/11/2022
  Time: 3:24 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:import url="/head.jsp"></c:import>
<h2>Danh sách Khách hàng</h2>
<table class="table table-striped table-dark">
    <thead></thead>
    <tr>
        <th>STT</th>
        <th scope="col">Họ tên</th>
        <th scope="col">Ngày sinh</th>
        <th scope="col">Giới tính</th>
        <th scope="col">Thẻ căn cước</th>
        <th scope="col">Số điện thoại</th>
        <th scope="col">email</th>
        <th scope="col">Địa chỉ</th>
        <th scope="col">Loại khách hàng</th>
        <th scope="col">Chỉnh sủa</th>
        <th scope="col">Xóa</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${customerList}" varStatus="status">
        <tr>
            <td><c:out value="${status.count}"/></td>
            <td><c:out value="${customer.name}"/></td>
            <td><c:out value="${customer.dateOfBirth}"/></td>
            <td>
                <c:if test="${customer.gender == true}">nam</c:if>
                <c:if test="${customer.gender == false}">nữ</c:if>
            </td>
            <td><c:out value="${customer.idCard}"/></td>
            <td><c:out value="${customer.phoneNumber}"/></td>
            <td><c:out value="${customer.email}"/></td>
            <td><c:out value="${customer.address}"/></td>
            <td><c:out value="${customer.customerType}"/></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
