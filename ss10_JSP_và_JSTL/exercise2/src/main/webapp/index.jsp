<%--
  Created by IntelliJ IDEA.
  User: buida
  Date: 30/11/2022
  Time: 11:30 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Ứng dụng Calculator</title>
  </head>
  <body>
<h1>Máy tính đơn giản</h1>
<form method="post" action="/calculator">
  <p>Số thứ nhất :</p>
  <input type="text" name="firstOperand" placeholder="First Operand">
  <p>Phép tính :</p>
  <select name="choose">
    <option value="+">Cộng</option>
    <option value="-">Trừ</option>
    <option value="*">Nhân</option>
    <option value="/">Chia</option>
  </select>
  <p>Số thứ 2 :</p>
  <input type="text" name="secondOperand" placeholder="Second Operand">
  <input type="submit" value="Tính" >
</form>
  </body>
</html>
