<%--
  Created by IntelliJ IDEA.
  User: buida
  Date: 29/11/2022
  Time: 10:54 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Ứng dụng Product Discount Calculator</title>
  </head>
  <body>
  <form action="/product" method="post">
    <h3>Product Description: </h3>
    <input style="height: 30px" type="text" name="productDescription" placeholder="productDescription"><br>
    <h3>List Price: </h3>
    <input style="height: 30px" type="text" name="listPrice" placeholder="listPrice"><br>
    <h3>Discount Percent: </h3>
    <input style="height: 30px" type="text" name="discountPercent" placeholder="discountPercent"><br>
<input type="submit" id="submit" value="Calculate Discount ">
  </form>
  </body>
</html>
