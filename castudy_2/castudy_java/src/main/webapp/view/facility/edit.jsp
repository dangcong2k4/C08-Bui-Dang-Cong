<%--
  Created by IntelliJ IDEA.
  User: buida
  Date: 08/12/2022
  Time: 9:56 SA
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
        <a class="nav-link active" href="/facility">Quay lại danh sách</a>
    </h2>
</center>
<form method="post">
    <h1 class="text-center">Chỉnh sửa khách hàng</h1>
    <c:if test="${Facility != null}">
        <input type="hidden" name="id" value="${facility.getId()}"/>
    </c:if>

        <div class="row col-12">
            <div class="row col-6">
                <div class="form-group distance">
                    <label for="name">Tên dịch vụ</label>
                    <input type="text" class="form-control inputSize" id="name" name="name" value="${facility.getName()}">
                </div>
                <div class="form-group distance">
                    <label for="area">Diện tích</label>
                    <input type="text" class="form-control inputSize" id="area" name="area" value="${facility.getArea()}">
                </div>
                <div class="form-group distance">
                    <label for="cost">Chi phí thuê</label>
                    <input type="text" class="form-control inputSize" id="cost" name="cost" value="${facility.getCost()}">
                </div>
                <div class="form-group distance">
                    <label for="max-people">Số người tối đa</label>
                    <input type="text" class="form-control inputSize" id="max-people" name="max_people" value="${facility.getMaxPeople()}">
                </div>
                <div class="form-group distance">
                    <label for="standard-room">Tiêu chuẩn phòng</label>
                    <input type="text" class="form-control inputSize" id="standard-room" name="standard_room" value="${facility.getStandardRoom()}">
                </div>
            </div>
            <div class="row col-6">
                <div class="form-group distance">
                    <label for="description-other-convenience">Mô tả tiện nghi</label>
                    <input type="text" class="form-control inputSize" id="description-other-convenience" name="description_other_convenience" value="${facility.getDescriptionOther()}">
                </div>
                <div class="form-group distance">
                    <label for="pool-area">Diện tích hồ bơi</label>
                    <input type="text" class="form-control inputSize" id="pool-area"  name="pool_area" value="${facility.getPoolArea()}">
                </div>
                <div class="form-group distance">
                    <label for="number-of-floor">Số tầng</label>
                    <input type="text" class="form-control inputSize" id="number-of-floor"  name="number_of_floors" value="${facility.getNumberOfFloors()}">
                </div>
                <div class="form-group distance">
                    <label for="facility-free">Dịch vụ miễn phí đi kèm</label>
                    <input type="text" class="form-control inputSize" id="facility-free"  name="facility_free" value="${facility.getFacilityFree()}">
                </div>
                <div class="distance">
                    <label class="form-label">Kiểu thuê</label>
                    <select name="rent_type_id" class="form-control custom-select">

                        <option value="1">year</option>
                        <option value="2">month</option>
                        <option value="3">day</option>
                        <option value="4">hour</option>
                    </select>
                </div>
                <div class="distance">
                    <label class="form-label">Loại dịch vụ</label>
                    <select name="facility_type_id" class="form-control custom-select">

                        <option value="1">villa</option>
                        <option value="2">house</option>
                        <option value="3">room</option>
                    </select>
                </div>



                <button type="submit" class="btn btn-primary">Sửa</button>
            </div>
        </div>
</form>

</body>
</html>
