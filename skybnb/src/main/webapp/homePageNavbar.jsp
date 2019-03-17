<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>indexNavbar</title>
</head>
<body>
	<nav class="navbar navbar-expand-md fixed-top bg-dark navbar-dark">

		<div class="container">
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbar2SupportedContent"
				aria-controls="navbar2SupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-center"
				id="navbar2SupportedContent">

				<ul class="navbar-nav">
					<li class="nav-item mx-2"><a class="nav-link"
						href="searchResult.jsp">進階搜尋</a></li>
					<li class="nav-item mx-2"><a class="nav-link" href="uploadHouse.jsp" id="up">上架房屋</a>
					</li>
				</ul>
				<a class="btn navbar-btn mx-2 text-white btn-outline-light" href="register.jsp">註冊</a> 
				<a class="btn navbar-btn mx-2 text-white btn-outline-light" href="login.jsp">登入</a>
			</div>
		</div>
	</nav>
<script src="js/jquery-3.3.1.min.js"></script>
<script>	
$(document).ready(function() {	
		var sessionname = "${sessionScope.name}";
		if(sessionname == ""){
			
		}else{
			$('#body').html("<a class=\"navbar-brand mb-0\" href=\"index.jsp\"> <img src=\"images/cloudy.png\" width=\"30\" height=\"30\" ></a> <a class=\"navbar-brand mb-0 h1 mr-5\" href=\"index.jsp\"> Skybnb </a> <a	class=\"navbar-brand mb-0 h1\"> <img src=\"images/search.png\"	width=\"25\" height=\"25\" ></a><form class=\"form-inline my-2 my-lg-0 mr-auto\"><input class=\"form-control mr-sm-2\" type=\"text\" placeholder=\"試試 台北\"><button class=\"btn btn-success my-2 my-sm-0\" type=\"submit\">搜尋</button></form><div class=\"collapse navbar-collapse justify-content-end \"><ul class=\"navbar-nav\">	<li class=\"nav-item\"><a class=\"nav-link\" href=\"#\">進階搜尋</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"houseForRent.jsp\">上架房屋</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"#\">訂單查詢</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"#\">願望清單</a></li><li class=\"nav-item dropdown\"><a	class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\"	role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\"	aria-expanded=\"false\"> ${sessionScope.name} </a><div class=\"dropdown-menu\" aria-labelledby=\"navbarDropdown\"><a class=\"dropdown-item\" href=\"#\">編輯基本資料</a>	<div class=\"dropdown-divider\"></div><a class=\"dropdown-item\" href=\"logout.controller\" id=\"logout\">登出</a>	</div></li></ul></div>");
		}		
		$('#logout').click(function(event) {

			 $.post("LoginOutController",
					 function(data) {
				 $('#body').html("<a class=\"navbar-brand mb-0\" href=\"index.jsp\"> <img src=\"images/cloudy.png\" width=\"30\" height=\"30\" ></a> <a class=\"navbar-brand mb-0 h1 mr-5\" href=\"index.jsp\"> Skybnb </a> <a	class=\"navbar-brand mb-0 h1\"> <img src=\"images/search.png\"	width=\"25\" height=\"25\" ></a><form class=\"form-inline my-2 my-lg-0 mr-auto\"><input class=\"form-control mr-sm-2\" type=\"text\" placeholder=\"試試 台北\"><button class=\"btn btn-success my-2 my-sm-0\" type=\"submit\">搜尋</button></form><div class=\"collapse navbar-collapse justify-content-end \"><ul class=\"navbar-nav\">	<li class=\"nav-item\"><a class=\"nav-link\" href=\"#\">進階搜尋</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"houseForRent.jsp\">上架房屋</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"register.jsp\">註冊</a></li>	<li class=\"nav-item\"><a class=\"nav-link\" data-toggle=\"modal\" data-target=\"#exampleModalCenter\" >登入</a></li></ul></div>	");
				 window.location.href = "index.jsp";	
			 	}
			 )	
		})
})

$("#up").click(function(){
	var sessionname = "${sessionScope.name}";
	if(sessionname == ""){
		$(function() {
			window.location.href = "login.jsp";
		});
		return false;
	}else{
		return true;
	}
})	
</script>
</body>
</html>