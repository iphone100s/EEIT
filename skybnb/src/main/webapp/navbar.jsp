<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>navbar</title>
<style>
.nav-link {
	font-size: 20px;
}
</style>

<link href="css/navbar/carousel.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-family.css" rel="stylesheet">
</head>
<body>
	<nav
		class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top"  id="body"> <a
		class="navbar-brand mb-0" href="index.jsp"> <img src="images/cloudy.png"
		width="30" height="30" alt="">
	</a> <a class="navbar-brand mb-0 h1 mr-5" href="index.jsp"> Skybnb </a> <a
		class="navbar-brand mb-0 h1"> <img src="images/search.png"
		width="25" height="25" alt="">
	</a>
	<form class="form-inline my-2 my-lg-0 mr-auto" action="<c:url value="SearchController"/>" method="get">
		<input class="form-control mr-sm-2" type="text" placeholder="試試 台灣" name="country">
		<button class="btn btn-success my-2 my-sm-0" type="submit" name="houseinfo" value="搜尋">搜尋</button>
	</form>
	<div class="collapse navbar-collapse justify-content-end ">
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link" href="searchResult.jsp">進階搜尋</a></li>
			<li class="nav-item"><a class="nav-link" href="uploadHouse.jsp" id="uploadhousenavbar">上架房屋</a></li>
			<li class="nav-item"><a class="nav-link" href="register.jsp">註冊</a></li>
			<li class="nav-item"><a class="nav-link" href="login.jsp">登入</a></li>
		</ul>
	</div>
</nav>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>	
$(document).ready(function() {	
	$("#uploadhousenavbar").click(function(){
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
	
		var sessionname = "${sessionScope.name}";
		if(sessionname == ""){
			
		}else{
			$('#body').html("<a class=\"navbar-brand mb-0\" href=\"index.jsp\"> <img src=\"images/cloudy.png\" width=\"30\" height=\"30\" ></a> <a class=\"navbar-brand mb-0 h1 mr-5\" href=\"index.jsp\"> Skybnb </a> <a	class=\"navbar-brand mb-0 h1\"> <img src=\"images/search.png\"	width=\"25\" height=\"25\" ></a><form class=\"form-inline my-2 my-lg-0 mr-auto\" action=\"SearchController\" method=\"get\"><input class=\"form-control mr-sm-2\" type=\"text\" placeholder=\"試試 台灣\" name=\"country\"><button class=\"btn btn-success my-2 my-sm-0\" type=\"submit\" name=\"houseinfo\" value=\"搜尋\">搜尋</button></form><div class=\"collapse navbar-collapse justify-content-end \"><ul class=\"navbar-nav\">	<li class=\"nav-item\"><a class=\"nav-link\" href=\"searchResult.jsp\">進階搜尋</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"orderlistselect.controller?memberID=${sessionScope.user}\">訂單查詢</a></li><li class=\"nav-item\"><a class=\"nav-link\" href=\"wishlistcontroller?memberID=${sessionScope.user}\">願望清單</a></li><li class=\"nav-item dropdown \"><a class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\" role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\"> 房屋管理 </a><form class=\"dropdown-menu dropdown-menu-right\" aria-labelledby=\"navbarDropdown\" action=\"housemanagement.controller\"><input type=\"hidden\" name=\"memberID\" value=\"${sessionScope.user}\"><input class=\"dropdown-item\" type=\"submit\" name=\"housemanagement\" value=\"房屋清單\" style=\"cursor:pointer\"><div class=\"dropdown-divider\"></div>	<input class=\"dropdown-item\" type=\"submit\" name=\"housemanagement\" value=\"上架房屋\" style=\"cursor:pointer\" id=\"uploadhousenavbar\">	</form></li><li class=\"nav-item dropdown\"><a	class=\"nav-link dropdown-toggle\" href=\"#\" id=\"navbarDropdown\"	role=\"button\" data-toggle=\"dropdown\" aria-haspopup=\"true\"	aria-expanded=\"false\"> ${sessionScope.name} </a><div class=\"dropdown-menu dropdown-menu-right\" aria-labelledby=\"navbarDropdown\"><a class=\"dropdown-item\" href=\"${pageContext.request.contextPath}/updateRegisterController\">編輯基本資料</a>	<div class=\"dropdown-divider\"></div><a class=\"dropdown-item\" href=\"logout.controller\" id=\"logout\">登出</a>	</div></li></ul><img alt=\"\" src=\"${sessionScope.photo}\" style=\"height:45px;width:45px;border-radius:999em;\"></div>");
		}		
})
</script>

</body>
</html>