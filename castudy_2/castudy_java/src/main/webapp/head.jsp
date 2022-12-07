<%--
  Created by IntelliJ IDEA.
  User: buida
  Date: 30/11/2022
  Time: 3:25 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/furama.css">
</head>
<body>
<div>
    <div class="row bg-secondary">

    </div>
    <div class="container-fluid" style="background-color: #218838">
        <div class="row" style="height: 120px">
            <div class="col-lg-2">
                <img class="headLeft" src="https://furamavietnam.com/wp-content/uploads/2018/10/logo.png">
            </div>
            <div class="col-lg-8">
                <p class="test headRight">Furama Resort</p>
            </div>
            <div class="col-lg-2">
                <img class="headLeft" src="https://furamavietnam.com/wp-content/uploads/2018/10/logo.png">
            </div>
        </div>
    </div>

    <nav class="navbar navbar-expand-lg navbar-light bg-light container-fluid">
        <div class="container-fluid" style="background-color: #046056   ">
            <a class="navbar-brand" href="/index.jsp">Trang chủ</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="">Nhân viên</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/customer">Khách hàng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/facility">Dịch vụ</a>

                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="">Hợp đồng</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>
</body>
</html>
