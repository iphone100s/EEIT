<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="images/cloudy.png">
<title>Skybnb 訂單完成</title>

<link href="css/login.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-family.css" rel="stylesheet">
</head>
<body>

	<header> 
		<jsp:include page="navbar.jsp" /> 
	</header>
	<div class="container">
		<div class="py-5 text-center mt-5">
			<h2 style="color: #0fad00">付款成功</h2>
		</div>

		<form class="form-signin text-center">
			<p style="font-size: 20px; color: #5C5C5C;">您的訂單已付款成功，歡迎查看訂單明細</p>
			<div class="py-5 text-center">
			<a href="<c:url value ="index.jsp"/>" class="btn btn-success">回到首頁</a>
			</div>

		</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>