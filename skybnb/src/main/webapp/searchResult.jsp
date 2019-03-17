<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<link rel="icon" href="images/cloudy.png">
<title>Skybnb 搜尋房源</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<jsp:include page="navbar.jsp" />

<!-- datepicker必要 -->
<link rel="stylesheet" href="css/index/jquery-ui.css">
<script src="js/index/jquery-ui.js"></script>
<link rel="stylesheet" href="css/search.css">
</head>

<body onload="subMap(),renew(document.getElementById('test1').selectedIndex)">
<form action="<c:url value="SearchController"/>" name="myForm" class="searchform" method="get">
	<p>
	<div class="buttons">
		<button class="btn btn-outline-secondary" type="button"
			data-toggle="collapse" data-target="#collapseExample"
			aria-expanded="false" aria-controls="collapseExample">日期</button>

		<button class="btn btn-outline-secondary" type="button"
			data-toggle="collapse" data-target="#collapseExample1"
			aria-expanded="false" aria-controls="collapseExample1">目的地</button>

		<button class="btn btn-outline-secondary" type="button"
			data-toggle="collapse" data-target="#collapseExample4"
			aria-expanded="false" aria-controls="collapseExample4">價格</button>

		<button class="btn btn-outline-secondary" type="button"
			data-toggle="collapse" data-target="#collapseExample5"
			aria-expanded="false" aria-controls="collapseExample5">房源類型</button>

		<a class="btn btn-outline-secondary dropdown-toggle" href="#"
			role="button" id="dropdownMenuLink" data-toggle="dropdown"
			aria-haspopup="true" aria-expanded="false"> 更多篩選條件 </a>

		<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
			<div data-spy="scroll" data-target="#list-example" data-offset="0" class="scrollspy-example">
				<div class="form-check form-check-inline">

<input type="checkbox" id="checkbox" class="form-check-input"
							style="margin-left: 15px;margin-top: 10px;"> <label for="checkbox"
							class="form-check-label" style="margin-top: 10px;">嚴選五星房源</label> <img alt=""
							src="images/index/star.png" style="height: 20px;margin-top:10px;">
					</div>
					<input type="hidden" id="starCountAverage" name="starCountAverage"
						value="">
				</div>
				<br>
				<button type="submit" class="btn btn-link" id="sub" name="houseinfo"
					value="套用" style="margin-left: 30px; margin-top: 5px;">套用</button>




			</div>


		</div>
	



		<div class="collapse" id="collapseExample">
			<div class="card card-body">
				<p>
					入住日期: <input type="text" id="datepicker" 
						placeholder="2018/09/28" autocomplete="off" name="startRentTime"
						value="${param.startRentTime}">
				</p>


				<p>
					退房日期: <input type="text" id="datepicker2" 
						placeholder="2018/09/30" autocomplete="off" name="endRentTime"
						value="${param.endRentTime}">

				</p>

				<div class="sub1">
					<button type="submit" class="btn btn-link" id="sub"
						name="houseinfo" value="套用">套用</button>
				</div>
			</div>
		</div>
		<div class="collapse" id="collapseExample1">

			<div class="card card-body">

				<div class="selectcountry">

					<p>


						國家: <select onChange="renew(this.selectedIndex);" name="country"
							id="test1">

							<option value="">選取國家
							<option value="台灣"
								<c:if test="${condition.country =='台灣'}">selected</c:if>>台灣

							<option value="日本"
								<c:if test="${condition.country =='日本'}">selected</c:if>>日本


							<option value="韓國"
								<c:if test="${condition.country =='韓國'}">selected</c:if>>韓國


						</select>

					</p>
					<!--地區： -->
					<p>
						地區: <select name="city" id="city">
							<option value="">選取地區
						</select>
					</p>



					<button type="submit" class="btn btn-link" id="sub"
						name="houseinfo" value="套用">套用</button>

				</div>
			</div>
		</div>


		<div class="collapse" id="collapseExample4">
			<div class="card card-body">
				<p>
					價格: <input type="text" name="price" placeholder="ex:1000"
						autocomplete="off" value="${condition.price}">以內
				<p>
					<button type="submit" class="btn btn-link" id="sub"
						name="houseinfo" value="套用">套用</button>
			</div>

		</div>



		<div class="collapse" id="collapseExample5">
			<div class="card card-body">

				<p>房源類型</p>
				<div class="form-check form-check-inline">

					<p>
						地區: <select name="houseSpace" id="houseSpace">
							<option value="">選擇住宿空間
							<option value="false">與房東共同居住
							<option value="true">房屋僅供房客居住
						</select>
					</p>

				</div>


				<button type="submit" class="btn btn-link" id="sub" name="houseinfo"
					value="套用">套用</button>


			</div>



		</div>
	</form>

	<div id="map"></div>


	<table>

		<div class="housetitle">
			<b>${sessionScope.name}一起與skybnb環遊世界</b>
		</div>

		<div class="selectbars">
		
			<a href="${pageContext.request.contextPath}/search.wellChoosen?country=台灣";><div class="selectbar">
				<img class="paris" src="${pageContext.request.contextPath}/images/index/taiwan.jpg"> <span
					class="parisfont"><b style="font-size: 20px;color: black;">台灣</b></span>

			</div></a>

			<a href="${pageContext.request.contextPath}/search.wellChoosen?country=日本"><div class="selectbar">
				<img class="paris" src="images/index/japan.jpg"> <span
					class="parisfont"><b style="font-size: 20px;color: black;">日本</b></span>

			</div></a>


			<a href="${pageContext.request.contextPath}/search.wellChoosen?country=韓國"><div class="selectbar">
				<img class="paris" src="images/index/korea.jpg"> <span
					class="parisfont"><b style="font-size: 20px;color: black;">韓國</b></span>

			</div></a>

		</div>


		<br/>
		<br/>
		<p>${errorMsgs.searcherror}</p>
		
		<div class="row">

			<c:forEach var="obj" items="${select}" varStatus="loop">

				<c:url value="orderHouse.jsp" var="link" scope="page">
					<c:param name="houseID" value="${obj.houseID}"/>
					<c:param name="startRentTime" value="${obj.startRentTime}" />
					<c:param name="endRentTime" value="${obj.endRentTime}" />
					<c:param name="disabledDates" value="${obj.disabledDates}" />
					<c:param name="orderedDates" value="${obj.orderedDates}" />
				</c:url>

				<div class="col-md-4">
					<div class="card mb-4 box-shadow">
					<a href="${link}" style="text-decoration:none;" class="m-0 p-0">
						<img class="card-img-top" src="${obj.housePicture1}" alt="">
						</a>
						<div class="card-body">

						
							<p class="card-text">${obj.country}</p>
							<span class="houseaddress">${obj.city}</span><br> <span
								class="housename">${obj.houseName}</span><br> <span>
								
							</span> <span class="houseprice">$ ${obj.price} TWD 一晚</span><br> <span
								class="houseSpace">${obj.houseSpace}</span><br> 
								<c:forEach var="count" begin= "1" end="${obj.starCountAverage}" step="1"><img src="images/index/star.png" class="star"></c:forEach><c:if test="${obj.starCountAverage %1 !=0 }"><img src="images/index/halfstar.png" class="star"></c:if><span id="totalComment" style="font-size: 10px;font-weight: bold;">(${obj.totalComment})</span>
								<img class="heart" id="${obj.houseID}" alt=""
								src="images/index/like.png" title="新增至願望清單" style="cursor:pointer"
								onmouseover="mouseOver1(this.id)"
								onmouseout="mouseOut1(this.id)" onclick="onClick1(this.id)">
							<!--                  The JavaScript this Keyword -->



							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group"></div>
							</div>
						</div>
						
					</div>
				</div>


			</c:forEach>


		</div>
	</table>
	
	
	<script>


	var userID = "${sessionScope.user}";
	
	
	function mouseOver1(id) {
		var houseID = ''+id;
		$.post("checkifExist",{"memberID":userID,"houseID":houseID},
				function(data) {				
					if(data == "isExist"){
						document.getElementById(id).src = "images/index/like2.png"
					}else if(data =="notExist"){
						document.getElementById(id).src = "images/index/like2.png"
					}
				});
	}
	function mouseOut1(id) {
		var houseID = ''+id;
		$.post("checkifExist",{"memberID":userID,"houseID":houseID},
				function(data) {				
				if(data =="isExist"){
						document.getElementById(id).src = "images/index/like2.png"
					}else if(data =="notExist"){
						document.getElementById(id).src = "images/index/like.png"
					}
				});
	}
	function onClick1(id) {
		var houseID = ''+id;
		$.post("addwishList",{"memberID":userID,"houseID":houseID},
				function(data) {				
					if(data == "notExist"){
						document.getElementById(id).src = "images/index/like2.png"
					}else if(data =="isExist"){
						document.getElementById(id).src = "images/index/like.png"
					}		
				});
	}

	function myFunction() {
		var x = document.getElementById("myDIV");
		if (x.style.display === "none") {
			x.style.display = "block";
		} else {
			x.style.display = "none";
		}
	}

	//  日期選擇

	$(function() {
		$("#datepicker").datepicker({
			
// 			altFormat : "yy/mm/dd",
			dateFormat :"yy/mm/dd",

			minDate : 0,
			changeMonth : true,
			changeYear : true,

		});
	});

	$(function() {
		$("#datepicker2").datepicker({
			
// 			altFormat : "yy/mm/dd",

			dateFormat :"yy/mm/dd",
			minDate : 0,
			changeMonth : true,
			changeYear : true,

		});
	});

	// 國家地區選擇	

	department = new Array();
	department[0] = [ "", "", "", "", ""];
	department[1] = [ "基隆市Keelung", "台北市Taipei", "新北市NewTaipei", "桃園市Taoyuan",
			" 苗栗縣Miaoli", "台中市Taichung", " 彰化縣Changhua", "新竹市Hsinchu",
			"台南市Tainan", "高雄市Kaohsiung", "屏東縣Pingtung", "宜蘭縣Yilan",
			" 花蓮縣Hualien", "臺東市Taitung", "南投縣Nantou", " 雲林縣Yunlin",
			"嘉義市Chiayi", "金門縣Kinmen", "澎湖縣Penghu", "連江縣Lienchiang",
			"連江縣Lienchiang", "南海諸島" ]; //台灣

	department[2] = [ "東京都Tokyo", "北海道Hokkaido", "青森縣Aomori-ken",
			"京都府Kyoto-hu", "岩手縣Iwate- ken", "大阪府Osaka -hu", "宮城縣Miyagi-ken",
			"滋賀縣Shiga-ken", "三重縣Mie-ken", "愛知縣Aichi-ken", "靜岡縣Shizuoka-ken",
			"鹿兒島縣	Kagoshima-ken", "岐阜縣Gifu-ken", "宮崎縣Miyazaki-ken",
			"長野縣Nagano-ken", "大分縣Oita-ken", " 山梨縣Yamanashi-ken",
			"熊本縣Kumamoto-ken", "福井縣Fukui- ken", "長崎縣Nagasaki-ken",
			"石川縣Ishikawa-ken", "佐賀縣Saga-ken", "富山縣Toyama-ken",
			"福岡縣Fukuoka-ken", " 新潟縣Niigata-ken", "高知縣Kochi-ken",
			"神奈川縣Kanagawa- ken", "愛媛縣Ehime-ken", "沖繩縣Okinawa-ken",
			"香川縣Kagawa-ken", "千葉縣Chiba-ken", "德島縣Tokushima-ken",
			"埼玉縣Saitama-ken", "山口縣Yamaguchi-ken", "群馬縣Gunma -ken",
			"廣島縣Hiroshima-ken", "栃木縣Tochigi-ken ", "岡山縣Okayama-ken",
			"茨城縣Ibaraki-ken", "島根縣Shimane-ken", "福島縣Fukushima-ken",
			"鳥取縣Tottori-ken", "兵庫縣Hyogo- ken", "秋田縣Akita-ken", "奈良縣Nara-ken",
			"和歌山縣Wakayama-ken" ];// 日本
	department[3] = [ "首爾特別市Seoul", "全羅北道Jeollabuk-do", "釜山廣域市Busan",
			"全羅南道Jeollanam-do", "大邱廣域市Daegu", "慶尙北道Gyeongsangbuk-do",
			"仁川廣域市Incheon", "光州廣域市Gwangju", "大田廣域市Daejeon",
			"慶尙南道Gyeongsangnam-do",
			"濟州特別自治道Jeju Special Self-Governing Province",
			"世宗特別自治市Sejong Special Self-Governing City", "蔚山廣域市	Ulsan",
			"京畿道Gyeonggi-do", "江原道Gangwon-do", "忠淸北道Chungcheongbuk-do",
			"忠淸南道Chungcheongnam-do" ];

	function renew(index) {
		

     
     var city = '${condition.city}';

		for (var i = 0; i < department[index].length; i++){
			if(department[index][i] == city){
				document.myForm.city.options[i] = new Option(department[index][i], department[index][i],"", true);// 設定新選項
			}else{
			document.myForm.city.options[i] = new Option(department[index][i], department[index][i]);// 設定新選項					
			}
		
		}
		document.myForm.city.length = department[index].length; // 刪除多餘的選項
		
		

	}	
	
	

</script>
	
	<script>

		
	
		var map;
		  var infowindow;
		function initMap() {
			
			var map = new google.maps.Map(document.getElementById("map"), {
				center : {
					lat : 0,
					lng : 0
				},
				zoom : 2
			});
		}
	</script>
	<script>
		
	var map;
		function subMap() {
			


		    //放要抓的資料範圍內為中心點
			map = new google.maps.Map(document.getElementById("map"), {
				center : {
					lat : 43.0478671,
					lng : 141.3628209,
				},
				zoom : 11
			});
	

			<c:forEach var='bean' items='${select}'>
		
			var lat = parseFloat(${bean.mapLatitude});
			var lng = parseFloat(${bean.mapLongitude});			

			var positon = {}; 
			var data = {};
			positon.lat = lat;
			positon.lng = lng;
			
						var marker = new google.maps.Marker({
						
							position: {lat: lat, lng: lng},
							map: map, 
						
						});
						var content = 
						'<div style="width:230px"><img src="${bean.housePicture1}" style="height:170px;width:230px;"><div><span style="color:#003377;font-weight:bold">${bean.city}</span><br>'+
						'<span style="font-weight:bold;font-size:15px;">${bean.houseName}</span><span><br> $${bean.price}TWD一晚</span><br>'+
						'<img src=images/index/star.png style="height:12px">${bean.starCountAverage}' ;
						
						var contentString = '<span style="font-weight:bold;color:#5b5b5b;">$${bean.price}<br>TWD</span>';
											
						attachSecretMessage(marker,content,contentString) ;
			</c:forEach>
			
		

		}
		


		function attachSecretMessage(marker, content,contentString) {
			var infowindow = new google.maps.InfoWindow({
				content:contentString ,

			});
			 var a = -1;
			infowindow.open(marker.get('map'), marker);
			google.maps.event.addListener(marker, 'click', function() {
				a= a*-1;
				if (a > 0) {
					infowindow.setContent(content);
					infowindow.open(marker.get('map'), marker);
				}else {
					 
					 infowindow.setContent(contentString);
					 infowindow.open(marker.get('map'), marker);
				}
			
			});
			
			
			
		
		}
		

		$("#checkbox").click(function(){
	
			if($("#checkbox").attr("checked",true)){
				$("#starCountAverage").val("5.0");
				$("#checkbox").attr("checked","checked");
			}else{
				$("#starCountAverage").val("");
				$("#checkbox").removeAttr("checked");
			}
		})
		
		
		
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC2ZmHaImBG5OjV01QTIcTk73kMeuD8lHo&callback=initMap">
		
	</script>
	<script>
    $(".houseSpace").each(function() {
    	   //class 
    	   if ($(this).text() == "false")
    	    $(this).text("與房東共同居住")
    	   if ($(this).text() == "true")
    	    $(this).text("房屋僅供房客居住");
    	  });

    
    </script>

</body>
<footer>

	<jsp:include page="footer.jsp" />

</footer>
</html>