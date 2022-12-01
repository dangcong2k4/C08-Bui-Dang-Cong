<%--
  Created by IntelliJ IDEA.
  User: buida
  Date: 01/12/2022
  Time: 3:30 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang chỉnh sửa</h1>
<a href="/product">Quay lại danh sách</a>
<<p>
    <c:if test='${requestScope["message"] != null}'>
        <span>${requestScope["message"]}</span>
    </c:if>
</p>
<form action="/product?action=edit&id=${product.getId()}" method="post">
    <pre>Tên:           <input type="text" name="name" value="<c:out  value='${product.getName()}'/>"> </pre>
    <pre>Giá tiền:      <input type="text" name="price" value="<c:out  value='${product.getPrice()}'/>"> </pre>
    <pre>Mô tả:         <input type="text" name="describe" value="<c:out  value='${product.getDescribe()}'/>"> </pre>
    <pre>Nhà sản xuất:  <input type="text" name="producer" value="<c:out value='${product.getProducer()}'/>"> </pre>
    <pre><button>Lưu</button></pre>
</form>
</body>
</html>
