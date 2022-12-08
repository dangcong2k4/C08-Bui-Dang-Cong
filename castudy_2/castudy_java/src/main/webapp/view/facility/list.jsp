<%--
  Created by IntelliJ IDEA.
  User: buida
  Date: 06/12/2022
  Time: 4:58 CH
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
<button  type="button" class="btn btn-primary" data-bs-toggle="modal">
    <a href="/facility?action=create" style="color: white;text-decoration: none">Thêm mới dịch vụ</a>
</button>
<form class="d-flex" action="/facility?action=search" method="post">
    <input class="form-control me-2" type="search" name="name" value="${searchName}" placeholder="tìm kiếm theo tên dịch vụ" aria-label="Search">
    <input class="form-control me-2" type="search" name="descriptionOther" value="${searchDO}" placeholder="tìm kiếm theo mô tả" aria-label="Search">
    <button class="btn btn-outline-success" type="submit" style="background-color: #b8daff">Tìm</button>
</form>
<table  id="tableFacility" class="table table-striped table-dark">
    <thead>
    <tr>
        <th>STT</th>
        <th scope="col">Tên dịch vụ</th>
        <th scope="col">Diện tích</th>
        <th scope="col">Chi phí thuê </th>
        <th scope="col">Số người tối đa</th>
        <th scope="col">Tiêu chuẩn phòng</th>
        <th scope="col">Mô tả tiện nghi</th>
        <th scope="col">Diện tích hồ bơi</th>
        <th scope="col">Số tầng </th>
        <th scope="col">Dịch vụ miễn phí đi kèm</th>
        <th scope="col">Kiểu thuê</th>
        <th scope="col">Loại dịch vụ</th>
        <th scope="col">Chỉnh sửa</th>
        <th scope="col">Xóa</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="facility" items="${facilityList}" varStatus="status">
        <tr>
            <td><c:out value="${status.count}"/></td>
            <td><c:out value="${facility.name}"/></td>
            <td><c:out value="${facility.area}"/></td>
            <td><c:out value="${facility.cost}"/></td>
            <td><c:out value="${facility.maxPeople}"/></td>
            <td><c:out value="${facility.standardRoom}"/></td>
            <td><c:out value="${facility.descriptionOther}"/></td>
            <c:if test="${facility.poolArea <= 0}">
                <td></td>
            </c:if>
            <c:if test="${facility.poolArea > 0}">
                <td><c:out value="${facility.poolArea}"/></td>
            </c:if>

            <c:if test="${facility.numberOfFloors <= 0}">
                <td></td>
            </c:if>
            <c:if test="${facility.numberOfFloors > 0}">
                <td><c:out value="${facility.numberOfFloors}"/></td>
            </c:if>

            <td><c:out value="${facility.facilityFree}"/></td>
            <td><c:out value="${facility.rentType}"/></td>
            <td><c:out value="${facility.facilityType}"/></td>
            <td>
                <button type="button" class="btn btn-primary" data-bs-toggle="modal">
                    <a href="/facility?action=edit&id=${facility.id}" style="color: white;text-decoration: none">Sửa</a>
                </button>

            </td>
            <td>
                <button  onclick="infoDelete('${facility.getId()}','${facility.getName()}')" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Xóa
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/facility" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-dark">
                    <input type="text" hidden name="action" value="delete">
                    <input type="text" hidden name="id" id="deleteId">
                    <h4> bạn có muốn xóa dịch vụ có tên:</h4><br>
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
        $('#tableFacility').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
</script>
</body>
</html>
