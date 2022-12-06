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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>

</head>
<body>
<c:import url="/head.jsp"></c:import>
<h2>Danh sách Khách hàng</h2>

<button  type="button" class="btn btn-primary" data-bs-toggle="modal">
    <a href="/customer?action=create" style="color: white;text-decoration: none">Thêm mới Khách hàng</a>
</button>
<form class="d-flex">
    <input class="form-control me-2" type="search" placeholder="tìm kiếm theo tên" aria-label="Search">
    <input class="form-control me-2" type="search" placeholder="tìm kiếm theo địa chỉ" aria-label="Search">
    <button class="btn btn-outline-success" type="submit" style="background-color: #b8daff">Tìm</button>
</form>
<table  id="tableCustomer" class="table table-striped table-dark">
    <thead>
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
        <th scope="col">Chỉnh sửa</th>
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
                <c:if test="${customer.gender}">nam</c:if>
                <c:if test="${!customer.gender}">nữ</c:if>
            </td>
            <td><c:out value="${customer.idCard}"/></td>
            <td><c:out value="${customer.phoneNumber}"/></td>
            <td><c:out value="${customer.email}"/></td>
            <td><c:out value="${customer.address}"/></td>
            <td><c:out value="${customer.customerType}"/></td>
            <td>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal">
                    <a href="/customer?action=edit&id=${customer.id}" style="color: white;text-decoration: none">Chỉnh sửa</a>
                </button>

            </td>
            <td>
                <button  onclick="infoDelete('${customer.getId()}','${customer.getName()}')" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Xóa
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/customer" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-dark">
                    <input type="text" hidden name="action" value="delete">
                    <input type="text" hidden name="id" id="deleteId">
                    <h4> bạn có muốn xóa khách hàng có tên:</h4><br>
                    <span id="deleteName" class="fw-bold"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không</button>
                    <button type="submit" class="btn btn-primary">Có</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function infoDelete(id,name) {
        console.log(id)
        document.getElementById("deleteId").value=id;
        document.getElementById("deleteName").innerText=name;
    }
</script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function() {
        $('#tableCustomer').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
</script>
</body>
</html>
