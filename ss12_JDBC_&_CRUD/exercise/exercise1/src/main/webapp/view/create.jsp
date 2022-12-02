<%--
  Created by IntelliJ IDEA.
  User: buida
  Date: 02/12/2022
  Time: 3:17 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Trang thêm mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<h1>Trang thêm mới</h1>
<h2>
    <a href="/user?action=user">Quay lại danh sách</a>
</h2>
<c:if test="${mess!=null}">
    <span style="color: blue">${mess}</span>
</c:if>
<form method="post">
    <label for="name">Họ tên:</label>
    <input type="text" class="form-control inputSize" name="name" id="name">
    <label for="name">Email:</label>
    <input type="text" class="form-control inputSize" name="email" id="email">
    <label for="name">Country:</label>
    <input type="text" class="form-control inputSize" name="country" id="country">
    <button type="submit" class="btn btn-primary">thêm</button>
</form>
</body>
</html>
