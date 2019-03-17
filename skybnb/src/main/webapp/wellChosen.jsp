<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<link href="css/index/modern-business.css" rel="stylesheet">
<link rel="icon" href="images/cloudy.png">
<title>Skybnb 精選房源</title>
</head>

  <body>
	<jsp:include page="navbar.jsp" />
    <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" style="background-image: url(images/index/taiwan.jpg)">
            <div class="carousel-caption d-none d-md-block">
              <p style="font-size: 120px;margin-bottom:110px;">Taiwan</p>
              <p></p>
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url(images/index/japanfeature.jpg)">
            <div class="carousel-caption d-none d-md-block">
          <p style="font-size: 120px;margin-bottom:110px;">Japan</p>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url(images/index/korea1.jpg)">
            <div class="carousel-caption d-none d-md-block">
        <p style="font-size: 120px;margin-bottom:110px;">Korea</p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </header>

    <!-- Page Content -->
    <div class="container">

    
            
<br><br>
      
        <!-- Features Section -->
      <div class="row">
        
        <div class="col-lg-6">
        <h2 style="font-weight: bold;">屬於您的完美房源</h2>
          <h6>搜尋設備一應俱全的好評房源</h6>
          <img alt="" src="images/index/placeholder.png" style="height: 25px;margin-right:-5px;margin-top: -5px;">
          <span style="font-size: 25px;">${select[0].houseName}</span>
          <ul>
          
            <p style="margin-top:10px;margin-left:25px;">${select[0].city}</p>
             <li>${select[0].houseType}</li>
            <li>${select[0].facility}</li>
            <li>${select[0].houseIntroduction}</li>
            
          </ul>
          <p></p>
        </div>
        <div class="col-lg-6">
          <img class="img-fluid rounded" src="${select[0].housePicture1}" alt="">
        </div>
      </div>
       <hr>

      <!-- Call to Action Section -->
      
      <div class="row mb-4">
        <div class="col-md-8">
          <span style="font-size:15px;font-weight: bold;">$${select[0].price}TWD一晚</span>
	<c:forEach var="count" begin= "1" end="${select[0].starCountAverage}" step="1"><img src="images/index/star.png" class="star" style="height:15px;"></c:forEach><c:if test="${select[0].starCountAverage %1 !=0 }"><img src="images/index/halfstar.png" class="star" style="height:15px;"></c:if><span id="totalComment" style="font-size: 10px;font-weight: bold;">(${select[0].totalComment})</span>
        </div>
        <div class="col-md-4">
          <a class="btn btn-lg btn-primary btn-block" href="#">立即訂房</a>
        </div>
      </div>
      <div>
      <img src="images/index/home.png" style="height:30px;margin-bottom: 12px;">
     <span class="my-4" style="font-size:30px;font-weight: bold;">為您精選${select[0].country}房源</span>
     </div>

<c:forEach var="result" items="${select}">
      
        <div class="col-lg-4 col-sm-6 portfolio-item" style="margin-top: 10px;float: left;">
          <div class="card h-100">
            <a href="#"><img class="card-img-top" src="${result.housePicture1}" alt=""></a>
            <span class="card-body">
              <div class="card-title">
              <span style="font-size:15px;font-weight: bold;color: #642100;">${result.country} </span>
                 <span style="font-size:15px;font-weight: bold;color: #642100;">${result.city} </span>
                 <br>
                <a href="#" style="color:#272727;">
                <span style="font-size:18px;font-weight: bold;">${result.houseName}</span></a>

              </span>
              <br>
                  <span class="card-text" style="font-size:15px;">$${result.price}TWD 一晚</span>
                  <br>
                  <c:forEach var="count" begin= "1" end="${result.starCountAverage}" step="1"><img src="images/index/star.png" class="star" style="height:15px;"></c:forEach><c:if test="${select[0].starCountAverage %1 !=0 }"><img src="images/index/halfstar.png" class="star" style="height:15px;"></c:if><span id="totalComment" style="font-size: 10px;font-weight: bold;">(${select[0].totalComment})</span>

            </div>
          </div>

       
  
    </div>
    </c:forEach> 
  
  </body>

</html>
