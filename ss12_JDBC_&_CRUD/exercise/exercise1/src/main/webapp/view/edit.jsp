<%--
  Created by IntelliJ IDEA.
  User: buida
  Date: 02/12/2022
  Time: 3:41 CH
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
<h1>Trang chỉnh sửa</h1>
<h2>
    <a class="nav-link active" href="/user?action=user">Quay lại danh sách</a>
</h2>
<c:if test="${mess!=null}">
    <span style="color: blue">${mess}</span>
</c:if>
<form method="post">
    <h1 class="text-center">Chỉnh sửa khách hàng</h1>
    <c:if test="${User != null}">
        <input type="hidden" name="id" value="<c:out value='${user.getId()}' />"/>
    </c:if>
    <div class="row col-12">
        <div class="row col-6">
            <div class="form-group distance">

                <label>Họ Tên</label>
                <input type="text" class="form-control inputSize" name="name" value="<c:out value='${user.getName()}' />">
            </div>
            <div class="form-group distance">
                <label>Email:</label>
                <input type="text" class="form-control inputSize" name="email"  value="<c:out value='${user.getEmail()}' />">
            </div>
            <div class="form-group distance">
                <label>Quốc gia:</label>
                <input type="text" class="form-control inputSize" name="country" value="<c:out value='${user.getCountry()}' />" >
            </div>
            <button type="submit" class="btn btn-primary">Chỉnh sửa</button>
        </div>
    </div>
</form>
</body>
</html>
