<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="icon" href="images/cloudy.png">
<title>Skybnb 願望清單</title>

<jsp:include page="navbar.jsp" />
<link rel="stylesheet" href="css/wishlist.css">
</head>
<body>
<div class="container mt-5">
<input type="hidden" id="listLength" value="${fn:length(selectForList)}">
			<h1 class="lead mt-3 mb-4">
				您已將 <strong class="text-danger">${fn:length(selectForList)}</strong>
				間房源加入願望清單
			</h1>
<div class="row">
<c:forEach var="obj" items="${selectForList}">
		<c:url value="orderHouse.jsp" var="order" scope="page">
			<c:param name="houseID" value="${obj.houseID}" />
		</c:url>

<div class="col-md-3">
		<div class="card mb-4 box-shadow">
						<a
							href="http://localhost:8080/skybnb/orderHouse.jsp?houseID=${obj.houseID}"
							style="text-decoration: none;" class="m-0 p-0"> <img
							class="card-img-top" src="${obj.housePicture1}" alt="">
						</a>
						<div class="card-body">


							<p class="card-text">${obj.country}</p>
							<span class="houseaddress">${obj.city}</span><br> <span
								class="housename">${obj.houseName}</span><br> <span>

							</span> <span class="houseprice">$ ${obj.price} TWD 一晚</span><br> <span
								class="houseSpace">${obj.houseSpace}</span><br>

							<c:forEach var="count" begin="1" end="${obj.starCountAverage}"
								step="1">
								<img src="images/index/star.png" class="star">
							</c:forEach>
							<c:if test="${obj.starCountAverage %1 !=0 }">
								<img src="images/index/halfstar.png" class="star">
							</c:if>
							<span id="totalComment"
								style="font-size: 10px; font-weight: bold;">(${obj.totalComment})</span>

							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group"></div>
							</div>
						</div>
					</div>
				
				</div>
			</c:forEach>
			</div>
			</div>
		<jsp:include page="footer.jsp" />
		<script>
	//textarea從資料庫取出時替換/n => <br/>
	var temp1 = $("#houseIntroduction").text().replace(/\n/g, "<br/>");
	$("#houseIntroduction").html(temp1);

	//轉換true,false
		$(".houseSpace").each(function() {
			if ($(this).text() == "false")
				$(this).text("與房東共同居住")
			if ($(this).text() == "true")
				$(this).text("房屋僅供房客居住");
		})
	</script>
</body>
</html>