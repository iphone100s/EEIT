<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="images/cloudy.png">
<title>Skybnb 客訴回報完成</title>
<link href="css/login.css" rel="stylesheet">
<link href="css/login/signin.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-family.css" rel="stylesheet">
</head>
<body>

	<header> 
		<jsp:include page="navbar.jsp" /> 
	</header>
	<div class="container">
		<div class="py-5 text-center mt-5">
			<h2>回報成功</h2>
		</div>

		<form class="form-signin text-center">
			<p>感謝您的回報！</p>
			<div class="py-5 text-center">
				<a href="http://localhost:8080/skybnb/index.jsp" class="btn btn-sm btn-primary btn-block" type="button">回到首頁</a>
			</div>

		</form>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>