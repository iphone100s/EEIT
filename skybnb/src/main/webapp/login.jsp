<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="images/cloudy.png">
<title>Skybnb 登入</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" 
	 href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
	 integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" 
	 crossorigin="anonymous">
<link href="css/login.css" rel="stylesheet">
</head>

<body>
	<header> 
		<jsp:include page="navbar.jsp"/>
	</header>
	
    <form action="<c:url value="/login.controller" />" method="POST" class="form-signin border border-secondary mb-5 ">
    	<h2 class="text-center">登入</h2>
      		<hr class="mt-4 mb-4">  
		      <div class="text-center   ">
		            <a class="btn btn-primary btn-lg btn-block mb-3 mt-3" href="https://zh-tw.facebook.com/" role="button" >使用Facebook帳號登入</a>
		            <a class="btn btn-outline-dark btn-lg btn-block mb-3 mt-3" href="https://www.google.com.tw/" role="button">使用Google帳號登入</a>
		      </div>
	
		<p class="text-center">或</p>

	
	       <div class="form-group form-inline " >
	   			<i class="far fa-envelope fa-2x col-md-2 "></i>  
	     		<input type="email" id="inputEmail" class="form-control w-75 " placeholder="信箱" name="username" required>
	      </div>


	      <div class="form-group form-inline text-center">
	      		<i class="fas fa-lock fa-2x col-md-2"></i>
	      		<input type="password" id="inputPassword" class="form-control  w-75" placeholder="密碼" name="password" required >
	      </div>
			<p class="text-center text-danger">${errorMsgs.loginerror}</p>
	      	<div class="checkbox mb-3 text-center">
	        	<label>
	         		<input type="checkbox" value="remember-me"> 記住我
	       		</label>
	      	</div>
	      	
      <button class="btn btn-lg btn-info btn-block" type="submit">登入</button>

       <p class="text-center "><a href="changePassword.jsp" class="text-secondary mt-3">忘記密碼?</a></p>
       <hr class="mt-4 mb-4">  
       <p class="text-center ">還沒有註冊帳號嗎?</p>
       <p class="text-center "><a href="register.jsp" class="text-secondary ">註冊</a></p>
      
    </form>
</body>
</html>