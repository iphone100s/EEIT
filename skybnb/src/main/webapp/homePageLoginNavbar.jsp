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
					<li class="nav-item mx-2"><a class="nav-link" href="orderlistselect.controller?memberID=${sessionScope.user}">訂單查詢</a>
					<li class="nav-item mx-2"><a class="nav-link" href="wishlistcontroller?memberID=${sessionScope.user}">願望清單</a>
					<li class="nav-item mx-2"><a class="nav-link" href="uploadHouse.jsp">上架房屋</a>
					<li class="nav-item mx-2"><a class="nav-link" href="housemanagement.controller?memberID=${sessionScope.user}&housemanagement=房屋清單">房屋清單</a>
					<li class="nav-item mx-2"><a class="nav-link" href="${pageContext.request.contextPath}/updateRegisterController">編輯個人資料</a>
					<li class="nav-item mx-2"><a class="nav-link" href="logout.controller">登出${sessionScope.name}</a>
					</li>
				</ul>
				
			</div>
		</div>
	</nav>

</body>
</html>