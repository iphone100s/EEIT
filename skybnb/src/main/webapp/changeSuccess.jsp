<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link rel="icon" href="images/cloudy.png">
<title>Skybnb 更新房源完成</title>
<!-- Required meta tags -->
<style>
img {
	border-radius: 10px;
}

#stepBar {
	margin-left: 280px;
	margin-bottom: 10px;
}
</style>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- fontAwesome -->
<link rel="stylesheet" 
				 href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
				 integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" 
				 crossorigin="anonymous">
<!-- <link rel="stylesheet" href="fonts/css/all.css"> -->
<!-- 樣板及套件的css -->
<link rel="stylesheet" href="css/uploadhouse/stepBar.css">

</head>

<body>
	<header> <jsp:include page="navbar.jsp" /> </header>
	<div class="container mt-5">
		<div id="stepBar" class="row bs-wizard" style="border-bottom: 0;">
			<div class="col-md-2 bs-wizard-step complete">
				<div class="text-center bs-wizard-stepnum">步驟 1</div>
				<div class="progress">
					<div class="progress-bar"></div>
				</div>
				<a href="#" class="bs-wizard-dot"></a>
				<div class="bs-wizard-info text-center text-body">更改房屋基本資料</div>
			</div>
			<div class="col-md-2 bs-wizard-step complete">
				<!-- complete -->
				<div class="text-center bs-wizard-stepnum">步驟 2</div>
				<div class="progress">
					<div class="progress-bar"></div>
				</div>
				<a href="#" class="bs-wizard-dot"></a>
				<div class="bs-wizard-info text-center text-body">上傳房屋照片</div>
			</div>

			<div class="col-md-2 bs-wizard-step complete">
				<!-- complete -->
				<div class="text-center bs-wizard-stepnum">步驟 3</div>
				<div class="progress">
					<div class="progress-bar"></div>
				</div>
				<a href="#" class="bs-wizard-dot"></a>
				<div class="bs-wizard-info text-center text-body">重新設定非出租日期</div>
			</div>

			<div class="col-md-2 bs-wizard-step active">
				<!-- active -->
				<div class="text-center bs-wizard-stepnum">步驟 4</div>
				<div class="progress">
					<div class="progress-bar"></div>
				</div>
				<a href="#" class="bs-wizard-dot"></a>
				<div class="bs-wizard-info text-center text-body">房屋更新成功</div>
			</div>
		</div>
		<div class="row text-center">
			<div class="mx-auto col-sm-6 col-sm-offset-3">
				<br> <br>
				<h2 class="mb-4" style="color: #0fad00 text-body">房屋更新成功</h2>
				<!-- 				測試用圖片 -->
				<!-- 				<img class="mb-3" src="images/doge.jpg" width="250px" height="150px" > -->
				<a	href="<c:url value ="/houseinformation.controller?action=preview&houseID=${update.houseID}"/>"
					method="post"> 
					<img class="mb-3" src="${update.housePicture1}" width="250px" height="150px">
				</a>
				<h3></h3>
				<p style="font-size: 20px; color: #5C5C5C;">
					您可以點擊房屋圖片進行預覽，</br>
					或點擊下方按鍵至「房屋清單」修改房屋出租資訊</p>
				<a
					href="<c:url value ="/housemanagement.controller?housemanagement=房屋清單"/>"
					class="btn btn-success" method="post">房屋清單 </a> <br>
				<br>
			</div>

		</div>
	</div>
	<footer> <jsp:include page="footer.jsp" /> </footer>
</body>

</html>