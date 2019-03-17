<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
<link rel="icon" href="images/cloudy.png">
<title>Skybnb 基本資料修改完成</title>
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


<script type="text/javascript" src="js/moment.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>

<body>
	<header> 
		<jsp:include page="navbar.jsp" />
	</header>
	
	
	
	<div class="container mt-5">
		<!--	流程Bar		-->
<%-- 		<jsp:include page="stepBarSuccess.jsp" /> --%>
		
		
		<div class="row text-center">
			<div class="mx-auto col-sm-6 col-sm-offset-3">
					<br> <br>
<%-- 					<p class="text-center text-danger">${sessionScope.name}</p> --%>
					<h2 class="mb-4" style="color: #0fad00">${sessionScope.name}基本資料更新成功</h2>
					<!-- 				測試用圖片 -->
					<!-- 				<img class="mb-3" src="images/doge.jpg" width="250px" height="150px" > -->
					<a	href="<c:url value ="index.jsp"/>"
						class="" method="post"> 
						<img class="mb-3" src="${sessionScope.photo}" width="250px" height="150px">
					</a>
					<h3></h3>
					<p style="font-size: 20px; color: #5C5C5C;">
						請點大頭貼，</br>
						或點擊下方按鍵至「首頁」回到首頁</p>
					<a
						href="<c:url value ="index.jsp"/>"
						class="btn btn-success" method="post">首頁</a> <br>
					<br>
			</div>

		</div>
	</div>
		
	
	<footer> <jsp:include page="footer.jsp" /> </footer>
</body>

</html>