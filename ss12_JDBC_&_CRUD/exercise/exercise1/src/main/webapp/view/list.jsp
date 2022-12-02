<%--
  Created by IntelliJ IDEA.
  User: buida
  Date: 02/12/2022
  Time: 11:27 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Quản lý User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</head>
<body>
<h1 class="text-center">Danh sách User</h1>
<button  type="button" class="btn btn-primary" data-bs-toggle="modal">
    <a href="/user?action=create" style="color: white;text-decoration: none">Thêm mới</a>
</button>
<form class="d-flex" action="/user?action=search" method="post">
    <input class="form-control me-2" type="search" name="country" value="${countrySave}" placeholder="Tìm kiếm theo quốc gia" aria-label="Search">
    <button class="btn btn-outline-success" type="submit" style="background-color: #b8daff ">Tìm </button>
</form>
<table id="tableCustomer" class="table table-dark table-striped ">
    <thead>
    <tr>
        <th>STT</th>
        <th scope="col">Họ tên</th>
        <th scope="col">Email</th>
        <th scope="col">Quốc gia</th>

        <th scope="col">Chỉnh sủa</th>
        <th scope="col">Xóa</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${userList}" varStatus="status">

        <tr class="fontSize1">
            <td><c:out value="${status.count}"/></td>
            <td><c:out value="${user.name}"/></td>
            <td><c:out value="${user.email}"/></td>
            <td><c:out value="${user.country}"/></td>
            <td>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal">
                    <a href="/user?action=edit&id=${user.id}" style="color: white;text-decoration: none">Chỉnh sửa</a>
                </button>

            </td>
            <td>
                <button  onclick="infoDelete('${user.getId()}','${user.getName()}')" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Xóa
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/user" method="post">
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
</body>
</html>
