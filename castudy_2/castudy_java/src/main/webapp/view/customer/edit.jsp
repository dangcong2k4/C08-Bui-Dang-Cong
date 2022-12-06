<%--
  Created by IntelliJ IDEA.
  User: buida
  Date: 06/12/2022
  Time: 10:48 SA
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
<center>
    <h1>Trang chỉnh sửa</h1>
    <h2>
        <a class="nav-link active" href="/customer">Quay lại danh sách</a>
    </h2>
</center>
<form method="post">
    <h1 class="text-center">Chỉnh sửa khách hàng</h1>
    <c:if test="${Customer != null}">
        <input type="hidden" name="id" value="${customer.getId()}"/>
    </c:if>
    <div class="row col-12">
        <div class="row col-6">
            <div class="form-group distance">

                <label>Họ Tên</label>
                <input type="text" class="form-control inputSize" name="name" value="${customer.getName()}">
            </div>
            <div class="form-group distance">
                <label>Ngày sinh:</label>
                <input type="text" class="form-control inputSize" name="date_of_birth"  value="${customer.getDateOfBirth()}">
            </div>
            <div class="form-group distance">
                <label>giới tính:</label>
                <input type="text" class="form-control inputSize" name="gender" value="${customer.getGender()}" >
            </div>
            <div class="form-group distance">
                <label>Thẻ căn cước :</label>
                <input type="text" class="form-control inputSize" name="id_card" value="${customer.getIdCard()}" >
            </div>
            <div class="form-group distance">
                <label>Số điện thoại:</label>
                <input type="text" class="form-control inputSize" name="phone_number" value="${customer.getPhoneNumber()}" >
            </div>
        </div>
        <div class="row col-6">
            <div class="form-group distance">
                <label>Email:</label>
                <input type="text" class="form-control inputSize" name="email" value="${customer.getEmail()}" >
            </div>
            <div class="form-group distance">
                <label>Địa chỉ</label>
                <input type="text" class="form-control inputSize" name="address" value="${customer.getAddress()}" >
            </div>
            <div class="form-group distance">
                <label>Loại kách hàng</label>
                <input type="text" class="form-control inputSize" name="customer_type_id" value="${customer.getCustomerType()}" >
            </div>

            <button type="submit" class="btn btn-primary">Chỉnh sửa</button>
        </div>
    </div>
</form>

</body>
</html>
