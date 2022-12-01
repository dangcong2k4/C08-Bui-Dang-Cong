<%--
  Created by IntelliJ IDEA.
  User: buida
  Date: 01/12/2022
  Time: 11:22 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 class="text-center">Trang danh sách</h1>
<a href="/product?action=create"><button class="btn btn-aqua bg-primary">Thêm mới sản phẩm</button></a>
<a href="/product?action=search"><button class="btn btn-danger">Tìm kiếm</button></a>

<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">Stt</th>
        <th scope="col">Tên sản phẩm</th>
        <th scope="col">giá</th>
        <th scope="col">Mô tả</th>
        <th scope="col">Nhà sản xuất</th>
        <th scope="col">Chỉnh sửa</th>
        <th scope="col">Xóa</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${productList}" varStatus="statust">
    <tr>
        <td><c:out value="${statust.count}"/></td>
        <td><c:out value="${product.getName()}"/></td>
        <td><c:out value="${product.getPrice()}"/></td>
        <td><c:out value="${product.getDescribe()}"/></td>
        <td><c:out value="${product.getProducer()}"/></td>
        <td><a href="/product?action=edit&id=${product.getId()}"><button>Sửa</button></a></td>
        <td>
            <button onclick="infoDelete('${product.getId()}')" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Xóa
            </button>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <form action="/product" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <input type="text" hidden name="action" value="delete">
                            Bnaj có muốn xóa không
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">không</button>
                            <button type="button" class="btn btn-primary">Có</button>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </td>
    </tr>
    </c:forEach>
    </tbody>
</table>
<script>
    function infoDelete(id,name) {
        console.log(id)
        document.getElementById("deleteId").value=id;
        document.getElementById("deleteName").innerText=name;
    }
</script>
</body>
</html>
