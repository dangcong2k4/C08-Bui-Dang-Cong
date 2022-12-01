<%--
  Created by IntelliJ IDEA.
  User: buida
  Date: 01/12/2022
  Time: 11:04 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang tìm kiếm </h1>
<a href="/product">Quay lại list</a>

<form action="/product?action=search" method="post">
    <pre>Tên Sản Phẩm:<input type="text" name="name"></pre>
    <pre><button>Search</button></pre>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Tên</th>
            <th scope="col">Giá</th>
            <th scope="col">Mô tả</th>
            <th scope="col">Nhà sản xuất</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${product}" varStatus="status">
            <tr>
                <td>${status.count()}</td>
                <td>${product.getName()}</td>
                <td>${product.getPrice()}</td>
                <td>${product.getDescribe()}</td>
                <td>${product.getProducer()}</td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</form>
</body>
</html>
