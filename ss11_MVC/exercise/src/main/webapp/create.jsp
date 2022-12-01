<%--
  Created by IntelliJ IDEA.
  User: buida
  Date: 01/12/2022
  Time: 11:22 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang thêm mới</h1>
<a href="/product">Quay lại danh sách</a>
<c:if test="${mess!=null}">
    <span style="color: blue">${mess}</span>
</c:if>
<form action="/product?action=create" method="post">
    <pre>Id: <input type="text" name="id"></pre>
    <pre>Tên: <input type="text" name="name"></pre>
    <pre>Giá tiền: <input type="text" name="price"></pre>
    <pre>Mô tả: <input type="text" name="describe"></pre>
    <pre>Nhà sản xuất: <input type="text" name="producer"></pre>
    <pre><button>Lưu</button></pre>
</form>
</body>
</html>
