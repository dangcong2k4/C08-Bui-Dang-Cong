<%--
  Created by IntelliJ IDEA.
  User: buida
  Date: 04/12/2022
  Time: 11:04 SA
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
<c:import url="/head.jsp"></c:import>
<h2 class="text-center">Trang thêm mới</h2>
<h2>
    <a class="nav-link active" href="/customer?action=customer">Quay lại danh sách</a>
</h2>
<c:if test="${mess!=null}">
    <span style="color: blue">${mess}</span>
</c:if>
<div align="center">

    <form method="post">
        <div class="row col-12">
            <div class="row col-6">
                <div class="form-group distance">
                    <label for="name">Tên khách hàng:</label>
                    <input type="text" class="form-control inputSize" name="name" id="name">
                </div>
                <div class="form-group distance">
                    <label for="date_of_birth">Ngày sinh:</label>
                    <input type="text" class="form-control inputSize" name="date_of_birth" id="date_of_birth">
                </div>
                <div class="distance">
                    <label class="form-label">Giới tính</label>
                    <br>
                    <div class="form-check form-check-inline col-md-3">
                        <label>
                            <input type="radio" class="form-check-input"  value="true" name="gender" checked>
                        </label>
                        <label class="form-check-label">Nam</label>
                    </div>
                    <div class="form-check form-check-inline col-md-3">
                        <label>
                            <input type="radio" class="form-check-input" value="false" name="gender">
                        </label>
                        <label class="form-check-label">Nữ</label>
                    </div>
                </div>
                <div class="form-group distance">
                    <label for="id_card">Số thẻ căn cước:</label>
                    <input type="text" class="form-control inputSize" name="id_card" id="id_card">
                </div>
            </div>
            <div class="row col-6">
                <div class="form-group distance">
                    <label for="phone_number">Số điện thoại:</label>
                    <input type="text" class="form-control inputSize" name="phone_number" id="phone_number">
                </div>
                <div class="form-group distance">
                    <label for="email">Email:</label>
                    <input type="text" class="form-control inputSize" name="email" id="email">
                </div>
                <div class="form-group distance">
                    <label for="address">địa chỉ:</label>
                    <input type="text" class="form-control inputSize" name="address" id="address">
                </div>
                <div class="distance">
                    <label class="form-label">Customer Type</label>
                    <select name="customer_type_id" class="form-select">
                        <option value="1">1.Diamond</option>
                        <option value="2">2.Platinium</option>
                        <option value="3">3.Gold</option>
                        <option value="4">4.Silver</option>
                        <option value="5">5.Member</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">thêm</button>
            </div>
        </div>

    </form>
</div>
</body>
</html>
