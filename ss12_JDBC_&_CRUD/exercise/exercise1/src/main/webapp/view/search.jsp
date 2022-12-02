<%--
  Created by IntelliJ IDEA.
  User: buida
  Date: 02/12/2022
  Time: 4:22 CH
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
</head>
<body>
<h1 class="text-center">Trang kết quả tìm kiếm</h1>
<h2>
    <a class="nav-link active" href="/user">Quay lại danh sách</a>
</h2>
<table class="table table-dark table-striped ">
    <thead>
    <tr>
        <th>STT</th>
        <th scope="col">Họ tên</th>
        <th scope="col">Email</th>
        <th scope="col">Quốc gia</th>
    </tr>
    </thead>
    <c:forEach var="user" items="${userList}" varStatus="status"><
    <tbody>
    <tr class="fontSize1">
        <td><c:out value="${status.count}"/></td>
        <td><c:out value="${user.name}"/></td>
        <td><c:out value="${user.email}"/></td>
        <td><c:out value="${user.country}"/></td>
    </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
