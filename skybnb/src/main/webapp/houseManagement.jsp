<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<link rel="icon" href="images/cloudy.png">
<title>Skybnb 管理房源</title>

<!-- 此網頁的css -->
<link href="css/uploadhouse/houseManagement.css" rel="stylesheet">
<!-- fontAwesome -->
<!-- fontAwesome -->
<link rel="stylesheet" 
				 href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
				 integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" 
				 crossorigin="anonymous">
<!-- <link rel="stylesheet" href="css/uploadhouse/all.css"> -->
<!-- 樣板及套件的css -->
<link rel="stylesheet" href="css/uploadhouse/searchresult.css">
</head>

<body>
	<header>
		<jsp:include page="navbar.jsp" />
	</header>
	<main class="mt-5">
	<div class="container">
		<hgroup class="mb20">
			<h1>搜尋結果</h1>
			<h2 class="lead">
				您目前有 <strong class="text-danger">${fn:length(select)}</strong>
				間房屋出租中
			</h2>
		</hgroup>
		<c:forEach var="obj" items="${select}">
		<c:url value="/houseinformation.controller?action=linkToUpdate&houseID=${obj.houseID}" var="link" scope="page"/>
		<c:url value="housePreview.jsp" var="preview" scope="page">
			<c:param name="houseID" value="${obj.houseID}" />
		</c:url>
		<c:url value="housePreview.jsp" var="preview" scope="page">
			<c:param name="startRentTime" value="${obj.startRentTime}" />
			<c:param name="endRentTime" value="${obj.endRentTime}" />
			<c:param name="houseID" value="${obj.houseID}" />
			<c:param name="disabledDates" value="${obj.disabledDates}" />
			</c:url>


			<section class="col-xs-12 col-sm-6 col-md-12">
				<article class="search-result row">
					<div class="col-xs-12 col-sm-12 col-md-3">
<!-- 						<a href="#" title="houseImage" class="thumbnail"><img -->
<!-- 							src="images/doge.jpg" width="250px" height="150px" -->
<!-- 							alt="Image Not Found" /></a> -->
						<a href="${preview}" title="houseImage" class="thumbnail"><img
							src="${obj.housePicture1}" width="250px" height="150px"
							alt="Image Not Found" /></a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-2">
						<ul class="meta-search">
							<li><i class="fa fa-calendar-alt"></i><span class="calendar">${obj.startRentTime}</span></li>
							<li><i class="fa fa-calendar-alt"></i><span class="calendar">${obj.endRentTime}</span></li>
							<li><i class="fas fa-home"></i><span class="home">${obj.houseSpace}</span></li>
							<li><i class="fas fa-user"></i><span class="ml-2">${obj.maxPeopleAvailable}
									人</span></li>
							<li><i id="dollar" class="fas fa-dollar-sign"></i><span
								class="dollar">${obj.price}</span></li>
						</ul>

					</div>
					<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
						<h3>
							<a href="${preview}" title="房屋名稱">${obj.houseName}</a>
							<span class="float-right h6"><a href="${link}" title="更改房屋資訊"><i
								class="fas fa-pencil-alt"></i></a></span>
						</h3>
						
								
						<p id="houseIntroduction">${obj.houseIntroduction}</p>
						
					</div>
					<span class="clearfix borda"></span>
				</article>
			</section>
		</c:forEach>
	</div>
	</main>
	<footer><jsp:include page="footer.jsp" /></footer>
	<script>
	//textarea從資料庫取出時替換/n => <br/>
	var temp1 = $("#houseIntroduction").text().replace(/\n/g, "<br/>");
	$("#houseIntroduction").html(temp1);

	//轉換true,false
		$(".home").each(function() {
			if ($(this).text() == "false")
				$(this).text("與房東共同居住")
			if ($(this).text() == "true")
				$(this).text("房屋僅供房客居住");
		})
	</script>
</body>
</html>