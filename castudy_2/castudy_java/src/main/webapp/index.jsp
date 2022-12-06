<%--
  Created by IntelliJ IDEA.
  User: buida
  Date: 30/11/2022
  Time: 2:27 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>FURAMA</title>
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
        <a class="navbar-brand" href="/index.jsp">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="">Employee</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="/customer">Customer</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="">Service</a>

            </li>
            <li class="nav-item">
              <a class="nav-link active" href="">Contract</a>
            </li>
          </ul>
          <form class="d-flex">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit" style="background-color: #b8daff">Search</button>
          </form>
        </div>
      </div>
    </nav>
    <div class="row">
      <div class="col-lg-4">
        <div class="overflow-scroll" style="height: 480px; width: 310px">
          <div class="row card" style="width: 20rem;">
            <img src="https://cdn.daynauan.info.vn/wp-content/uploads/2019/05/bi-quyet-chon-hai-san-tuoi-ngon.jpg" class="card-img-top" alt="...">
            <div class="card-body ">
              <p class="card-text text-center">hải sản phong phú</p>
              <div class="d-flex justify-content-center">
                <a class="btn btn-primary " href="https://daynauan.info.vn/bi-quyet-chon-hai-san-tuoi" role="button">chi tiết</a>
              </div>

            </div>
          </div>
          <div class="row card" style="width: 20rem;">
            <img src="https://phuquocsensetravel.com/view/at_nhung-trai-nghiem-ban-nen-thu-o-dao-phu-quoc_91dd4e26297a26386e345742c100fb19.jpg" class="card-img-top" alt="...">
            <div class="card-body">
              <p class="card-text text-center">nơi vui chơi ở bãi biển</p>
              <div class="d-flex justify-content-center">
                <a class="btn btn-primary" href="https://phuquocsensetravel.com/nhung-trai-nghiem-ban-nen-thu-o-dao-phu-quoc-n.html" role="button">chi tiết</a>
              </div>

            </div>
          </div>
          <div class="row card" style="width: 20rem;">
            <img src="https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2020/06/Review-Furama-Resort-Da-Nang-2.jpg" class="card-img-top" alt="...">
            <div class="card-body">
              <p class="card-text text-center">nơi nghỉ nghơi và thư giãn</p>
              <div class="d-flex justify-content-center">
                <a class="btn btn-primary" href="https://www.vntrip.vn/cam-nang/review-furama-resort-da-nang-102606" role="button">chi tiết</a>
              </div>

            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img src="https://phulong.com/imgvtool.ashx?url=/UploadFiles/image_contents/1200-x-700-toan-canh-01-01-7a1dc1.png&w=1200" class="d-block w-100 sizePhoto" >
            </div>
            <div class="carousel-item ">
              <img src="https://luvill.asia/wp-content/uploads/2019/08/kien-truc-furama-resort-da-nang-1024x680-1-1024x680.jpg" class="d-block w-100 sizePhoto" >
            </div>
            <div class="carousel-item ">
              <img src="https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2020/06/Review-Furama-Resort-Da-Nang-2.jpg" class="d-block w-100 sizePhoto" >
            </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>
      </div>

    </div>
    <div class="row">
      <div class="col-lg-2">
        <img class="headLeft" src="https://furamavietnam.com/wp-content/uploads/2018/10/logo.png">
      </div>
      <div class="col-lg-8 align-items-center text-center">
        <p style="font-size: 20px">Liên hệ</p>
        <a style="font-size: 10px">
          103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son District, Danang City, Vietnam</a><br>
        <a style="font-size: 10px">Tel.: 84-236-3847 333/888 * Fax: 84-236-3847 666</a><br>
        <a style="font-size: 10px"> Email: reservation@furamavietnam.com * www.furamavietnam.com <br>7,0 km from Danang Airport</a>
      </div>
      <div class="col-lg-2">
        <img class="headLeft" src="https://furamavietnam.com/wp-content/uploads/2018/10/logo.png">
      </div>
    </div>
  </div>

  </body>
</html>
