<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<link rel="icon" href="images/cloudy.png">
<title>Skybnb 客訴回報</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

</head>

<body>
	<header> 
		<jsp:include page="navbar.jsp"/>
	</header>
	<br>
	<!--內文-->
	<div class="container" style="width: 500px;">
		<div class="card card-login mx-auto mt-5" style="height: 500px">
			<div class="card-header">客訴回報</div>
			<div class="card-body">
				<form action="<c:url value ="/report.controller"/>" method="post">
					<div class="form-group">
					<label for="inputmasgtitle">客訴主題</label>
						<div class="form-label-group">
							
					
							<span>${errorMsgs["titleError"]}</span>
							<select name="reportTitle" class="mdb-select md-form" style="width: 425px"  >
								<span>${errorMsgs["titleError"]}</span>
                                <option name="reporttitle" value="">選擇你的主題</option>
								<option name="reporttitle" value="房間整理">房間整理</option>
								<option name="reporttitle" value="找不到鑰匙">找不到鑰匙</option>
								<option name="reporttitle" value="紅利點數">紅利點數</option>
								<option name="reporttitle" value="修繕浴室">修繕浴室</option>
								<option name="reporttitle" value="環境整潔">環境整潔</option>
								<option name="reporttitle" value="客訴房東">客訴房東</option>
								<option name="reporttitle" value="平台問題">平台問題</option>
								<option name="reporttitle" value="其他...">其他...</option>
							</select>

						</div>
					</div>
					<div class="form-group">
						<label for="reportDiscription">問題描述</label>
						<div class="form-label-group">
							
							<span>${errorMsgs["messageError"]}</span> <textarea
								name="reportDiscription" style="width: 425px" rows="8" cols="20"></textarea>
						</div>
					</div>
					<input type="hidden" name="memberReport" value="${param.MemberReport}">
					<input type="hidden" name="houseMember" value="${param.HouseMember}">
					<button class="btn btn-primary btn-block" type="submit">送出</button>
				</form>
			</div>
		</div>
	</div>
</body>

</html>