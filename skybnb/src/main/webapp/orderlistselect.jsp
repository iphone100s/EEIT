<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html lang="en">

<head>
<link rel="icon" href="images/cloudy.png">
<title>Skybnb 訂單查詢</title>

<style>

</style>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link rel="stylesheet" href="css/orderlist/orderlistselect.css">

</head>


<body>
<jsp:include page="navbar.jsp" />
	<main role="main" class="mt-2"> 


<div id="title">
	<IMG id="mapicon" src="images/orderlist/mapicon.png" /><strong id="text">您的旅程</strong>
</div>	

<div class="center">

    <table class="table table-hover">
      <thead>
        <tr>
          <th>訂單編號</th>
          <th>房間名稱</th>
          <th>住宿類型</th>
          <th>訂單日期</th>
          <th>入住日期</th>
          <th>退房日期</th>
          <th>人數</th>
          <th>紅利</th>
          <th>結帳金額</th>


        </tr>
      </thead>
      <tbody>
      	<c:forEach var="obj" items="${select}">
			<c:url value="/orderlistdetail.controller" var="link" scope="page">
			<c:param name="orderHouseNumber" value="${obj[0]}"/>
		</c:url>
		<tr>
          <td><a href="${link}">${obj[0]}</a></td>
          <td>${obj[1]}</td>
          <td>${obj[2]}</td>
          <td>${obj[3]}</td>
          <td>${obj[4]}</td>
          <td>${obj[5]}</td>
          <td>${obj[6]}</td>
          <td>${obj[7]}</td>
          <td>${obj[8]}</td>
        </tr>
        </c:forEach>
      </tbody>
      
    </table>
  </div>
   <div >${ errorMsgs["select"]}</div> 

	<!-- 	以上為自己寫的部分 </main> -->
</body>
<!-- 這行要加 -->
<footer >
<jsp:include page="footer.jsp" />
</footer>
</html>